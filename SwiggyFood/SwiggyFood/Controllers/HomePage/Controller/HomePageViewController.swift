//
//  HomePageViewController.swift
//  SwiggyFood
//
//  Created by PavunRaj-OBS-36 on 16/12/22.
//

import UIKit

class HomePageViewController: UIViewController {

    //MARK: Storybord Connections
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var viewReceiptBtn: UIButton!
    @IBOutlet weak var myOrderBtn: UIButton!
    @IBOutlet weak var categoryHeaderLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var numItems: UILabel!
    @IBOutlet weak var countItems: UILabel!
    @IBOutlet weak var viewCartbtn: UIButton!
    @IBOutlet weak var btnView :UIView!
    var addBtnclick = false
    var quantity:Int = 0
    var productCost: Int = 0
    var itemCal: Int = 0
    @IBOutlet weak var collectionView : UICollectionView!{
        didSet{
            collectionView.register(CategoryListCell.nib, forCellWithReuseIdentifier: CategoryListCell.identifier)
           
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = .clear
//            collectionView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            

//            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//                layout.scrollDirection = .horizontal
//            }
        }
    }
    private let tokenKey = "f765c5f2-216d-4637-88ec-b73d65e2fdeb"
    var categotyResponseDetails : CategoryListResponse? = nil
    var ProductListResponseDetails: ProductListResponse? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.register(ProductListCell.nib, forCellReuseIdentifier: ProductListCell.identifier)
        tableView.separatorStyle = .none
        tableView.delegate =  self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = ColorPalette.backTheme
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        // Do any additional setup after loading the view.
        
        callAPIFunction()
        callProductListAPI()
    }
    
    // MARK: - UIButton Tap Action

    @IBAction func backBtnTapped(_ sender: UIButton) {
        
    }
    @IBAction func viewReceiptBtnTap(_ sender: UIButton) {
    }
    @IBAction func myOrderBtnTap(_ sender: UIButton) {
    }

}


extension HomePageViewController {
    
    func setupUI(){
        //hideNavigationBar()
        bgView.backgroundColor =  ColorPalette.backTheme
        if addBtnclick{
            self.bottomView.isHidden = false
        }else{
            if itemCal == 0 {
                self.bottomView.isHidden = true

            }

        }

        backBtn.setButton(titleColor: UIColor.black, backgroundColor: .clear, cornerRadius: 0, borderColor: .clear, borderWidth: 0, title: ConstantFile.back, fontSize: UIFont.systemFont(ofSize: 20))
       backBtn.contentHorizontalAlignment = .leading
        headerLbl.setupHeaderLbl(label:headerLbl, txt: ConstantFile.headerText)
        
        viewReceiptBtn.setButton(titleColor: UIColor.black, backgroundColor: ColorPalette.btnColor, cornerRadius: viewReceiptBtn.frame.height / 2, borderColor: .clear, borderWidth: 1, title: ConstantFile.receiptText, fontSize: UIFont.systemFont(ofSize: 20))
        myOrderBtn.setButton(titleColor: UIColor.black, backgroundColor: ColorPalette.btnColor, cornerRadius: myOrderBtn.frame.height / 2, borderColor: .clear, borderWidth: 1, title: ConstantFile.myOrderText, fontSize: UIFont.systemFont(ofSize: 20))
        categoryHeaderLbl.setupDecLbl(label: categoryHeaderLbl, txt: ConstantFile.categories)
        numItems.setupDescLbl(label: numItems, txt: "\(itemCal)Items")
        countItems.setupDescLbl(label: countItems, txt: "$20")
        viewCartbtn.setButton(titleColor: UIColor.red, backgroundColor: ColorPalette.whiteColor, cornerRadius: viewCartbtn.frame.size.height / 2, borderColor: .clear, borderWidth: 1, title: ConstantFile.viewCart, fontSize: UIFont.boldSystemFont(ofSize: 20))
        
        btnView.setupUIview(background: .white, cornerRadius: viewCartbtn.frame.size.height / 2, borderColor: .clear, borderWidth: 1)
        
        if let image = UIImage(named: "receiptIcon.pdf") {
            viewReceiptBtn.setImage(image, for: .normal)
        }
        if let image = UIImage(named: "cartIcon.pdf") {
            myOrderBtn.setImage(image, for: .normal)
        }
        if let image = UIImage(named: "backIcon.pdf") {
            backBtn.setImage(image, for: .normal)
        }
        self.countItems.text = "\(ConstantFile.currency)\(self.productCost)"


    }
    
    
    func callAPIFunction(){
        
        let param = TokenParam.init(token: tokenKey )
        CategoryListViewModel.categoryListAPIRequest(with: param, controller: self, boolLoaderEnable: false, completion: {
            Response in
            switch Response {
            case .failure(_):
                print("falire")
            case .success(let result):
                print("Success",result)
                
                if result.model.count > 0  {
                    self.categotyResponseDetails = result
                }
                self.collectionView.reloadData()
            }
            
        })
    }
    
    
    
    func callProductListAPI(){
        let param = ProductParam(token: tokenKey, Agencyid: 3, Tempfare: false)
        CategoryListViewModel.ProductListAPIRequest(with: param, controller: self, boolLoaderEnable: true, completion: {
            Response in
            switch Response {
            case .failure(_):
                print("The product list failure")
            case .success(let result):
                if result.list.count > 0{
                    self.ProductListResponseDetails = result
                }
                self.tableView.reloadData()
            }
        })
    }
    
    
    
    
}


extension HomePageViewController : UITableViewDelegate{
    
    
}


extension HomePageViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductListResponseDetails?.list.count ?? 0
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "ProductListCell") as? ProductListCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        let image = (ProductListResponseDetails?.list[indexPath.row].productImageURL ?? "")
        let fileUrl = NSURL(string:image)
        cell.productLbl.setupNormalLbl(label: cell.productLbl, txt: ProductListResponseDetails?.list[indexPath.row].productName ?? "")
                cell.productCostLbl.text = "\(ConstantFile.currency)\(String(describing: ProductListResponseDetails?.list[indexPath.row].productCost ?? 0))"
        if fileUrl != nil {
            cell.productImg.downloaded(from:  fileUrl! as URL)
        }
        let descMin = String(describing: ProductListResponseDetails?.list[indexPath.row].productMiscDescription ?? "")
        let desc = String(describing: ProductListResponseDetails?.list[indexPath.row].productDescription ?? "")
                          if (descMin == "") || desc == ""{
                              cell.productDecLbl.text = ConstantFile.empty
            
        }else{
            cell.productDecLbl.setupDesc(label: cell.productDecLbl, txt: "\(String(describing: ProductListResponseDetails?.list[indexPath.row].productMiscDescription ?? ""))\n\(String(describing: ProductListResponseDetails?.list[indexPath.row].productDescription ?? ""))")
        }
        cell.addBtnClick = {
            self.addBtnclick =  true
            
            if (indexPath.row) == (cell.countAddBtn.tag){
                let textfieldInt: Int? = Int((cell.countLbl.text)!)
                self.quantity = textfieldInt ?? 0
                self.quantity += 1
            }else{
                let textfieldInt: Int? = Int((cell.countLbl.text)!)
                self.quantity = textfieldInt ?? 0
                self.quantity += 1
            }
            cell.countLbl.text = "\(self.quantity)"
                self.productCost += self.ProductListResponseDetails?.list[indexPath.row].productCost ?? 0

            self.setupUI()
            
        }
        cell.subBtnClick = {
            self.addBtnclick =  false
            if self.quantity == 0 {
                cell.stackView.isHidden = true
                cell.addBtn.isHidden = false
                self.itemCal -= 1

            }else{
                self.quantity -=  1

            }
           self.productCost -= self.ProductListResponseDetails?.list[indexPath.row].productCost ?? 0
            cell.countLbl.text = "\(self.quantity)"
            
            self.setupUI()
        }
        
        cell.addClick = {
            cell.addBtn.tag = indexPath.row;

            if (indexPath.row) == cell.addBtn.tag{
                cell.stackView.isHidden = false
                cell.addBtn.isHidden = true
                self.bottomView.isHidden = false
                self.itemCal += 1
                let textfieldInt: Int? = Int((cell.countLbl.text)!)
                self.quantity = textfieldInt ?? 0
                self.quantity += 1
                cell.countLbl.text = "\(self.quantity)"
                    self.productCost += self.ProductListResponseDetails?.list[indexPath.row].productCost ?? 0

                self.setupUI()
            }else{
               
                if self.quantity == 0 {
//                    cell.stackView.isHidden = true
//                    cell.addBtn.isHidden = false
//                    self.itemCal -= 1
                }
                self.setupUI()
            }
        
        }
        
                
        let productCategory = ProductListResponseDetails?.list[indexPath.row].productVegCategory
        
        switch productCategory{
            
        case 1:
            cell.productCategoryImg.image = UIImage(named: "vegIcon.png")
        case 3:
            cell.productCategoryImg.image = UIImage(named: "NonVegIcon.png")
        default:
            cell.productCategoryImg.image = UIImage(named: "vegIcon.png")

        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 150
    }
    
}


extension HomePageViewController : UICollectionViewDelegate{
    
}

extension HomePageViewController: UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return  categotyResponseDetails?.model.count ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
        guard let cellCategory = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryListCell.identifier, for: indexPath) as? CategoryListCell else {
            return UICollectionViewCell()
        }
    
        let categoryName = categotyResponseDetails?.model[indexPath.row].categoryname ?? ""
        
        if categoryName == "<null>" || categoryName == "" {
            cellCategory.categoryLbl.setupItemLbl(label: cellCategory.categoryLbl, txt: "No category")
        }else{
            cellCategory.categoryLbl.setupItemLbl(label: cellCategory.categoryLbl, txt: categoryName)
        }

        return cellCategory
            
        
    }
    
    
}


extension HomePageViewController : UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/5 , height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0,right: 0)
    }



    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }


}


extension HomePageViewController {
    
    @objc func addBtn(){
        
    }

}


import Kingfisher

extension UIImageView {
    func loadImageByUrl(_ url: String) {
        if let urlSource = URL(string: url){
            KingfisherManager.shared.retrieveImage(with: ImageResource(downloadURL: urlSource), options: [.keepCurrentImageWhileLoading, .cacheOriginalImage], progressBlock: nil, completionHandler: { result in
                switch result {
                case .success(let value):
                    print("Image: \(value.image). Got from: \(value.cacheType)")
                    self.image = value.image
                case .failure(let error):
                    print("Error: \(error)")
                }
            })
        }
    }
}

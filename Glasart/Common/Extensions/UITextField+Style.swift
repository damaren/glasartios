import UIKit

extension UITextField {
    
    private func createImageView(for image:UIImage, width:Int, height:Int) -> UIView {
        let offset = 7
        let sizeOffset = offset * 2
        let area = CGRect(x: 0, y: 0, width: width, height: height)
        let view = UIView(frame: area)
        
        let imageArea = CGRect(x: 0, y: offset, width: width - sizeOffset, height: height - sizeOffset)
        let imageView = UIImageView(frame: imageArea)
        
        view.addSubview(imageView)
        imageView.image = image
        
        return view
    }
    
    private func setIcon(image:UIImage?) {
        self.leftViewMode = .never
        self.leftView = nil
        
        guard let newImage = image else { return }
        
        let height = Int(self.bounds.height)
        let width = height
        self.leftViewMode = .always
        self.leftView = createImageView(for: newImage, width: width, height: height)
    }
    
    private func createBottomLine(color:UIColor = UIColor.white) {
        let width = Int(self.bounds.width)
        let height = Int(self.bounds.height)
        let lineHeight = 1
        
        let area = CGRect(x: 0, y: height - lineHeight, width: width, height: lineHeight)
        let line = UIView(frame: area)
        self.addSubview(line)
        line.backgroundColor = color
    }
    
    public func inputStyle(icon:UIImage) {
        self.borderStyle = .none
        self.backgroundColor = UIColor.clear
        self.textColor = UIColor.white
        self.setIcon(image: icon)
        self.createBottomLine()
    }
    
    public func simpleInputStyle() {
        self.borderStyle = .none
        self.backgroundColor = UIColor.clear
        self.textColor = UIColor.white
        self.createBottomLine()
        
        let placeholder = self.placeholder ?? ""
        
        let attributedKeys : [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.font : self.font!,
            NSAttributedStringKey.foregroundColor : self.textColor!
        ]
        
        let placeholderString = NSAttributedString(string: placeholder, attributes: attributedKeys)
        self.attributedPlaceholder = placeholderString
    }
    
    public func simplePlaceholderStyle() {
        self.borderStyle = .none
        self.backgroundColor = UIColor.clear
        self.textColor = UIColor.white
        
        let placeholder = self.placeholder ?? ""
        
        let attributedKeys : [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.font : self.font!,
            NSAttributedStringKey.foregroundColor : self.textColor!
        ]
        
        let placeholderString = NSAttributedString(string: placeholder, attributes: attributedKeys)
        self.attributedPlaceholder = placeholderString
    }
    
}

import UIKit

let image = UIImage(named: "landscape.jpg")!
let mask = UIImage(named: "mask.png")!

let imageRenderer = UIGraphicsImageRenderer(size: image.size)

let tintedImage = imageRenderer.image { (ctx) in
    let cgContext = ctx.cgContext
    let rect = CGRect(origin: .zero, size: image.size)
    image.draw(in: rect)
    cgContext.saveGState()
    cgContext.translateBy(x: 0, y: rect.size.height)
    cgContext.scaleBy(x: 1.0, y: -1.0);
    cgContext.clip(to: rect, mask: mask.cgImage!)
    cgContext.setBlendMode(.color)
    UIColor.red.setFill()
    cgContext.fill(rect)
    cgContext.restoreGState()
}

tintedImage



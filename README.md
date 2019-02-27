# Card Components

Render card components for iOS with shadows and rounded corners.

- [CardView](#cardview)
- [CompositeCardView](#compositecardview)
- [PartialCardView](#partialcardview)
- [PartialCardImage](#partialcardimage)
- [CardTableViewController](#cardtableviewcontroller)

## CardView

Render rounded corners and shadows with a single `UIView`.

![Card View](https://user-images.githubusercontent.com/622192/53522340-64600d80-3a97-11e9-87c5-0d2e8f6e7e87.png)

## CompositeCardView

Also need to clip content inside a card?

Use a composite card view to render unclipped shadows in a container card view, and render rounded corners in a content view that clips inner content.

![Composite Cards](https://user-images.githubusercontent.com/622192/53522455-a5582200-3a97-11e9-8f2c-8fc9f96ece91.png)

![Composite Cards Exploded](https://user-images.githubusercontent.com/622192/53522467-ab4e0300-3a97-11e9-98f3-6542068b899f.png)

## PartialCardView

Only need to render the top, bottom, or side edges of a card?

Use a partial card view with drawing modes to render `top`, `center`, `bottom`, or `all` effects.

![Partial Cards](https://user-images.githubusercontent.com/622192/53522539-cfa9df80-3a97-11e9-873d-360be7246a04.png)

## PartialCardImage

Similar to `PartialCardView`, instead of rendering effects dynamically with `CALayer`, the effects can be rendered into a static, resizable `UIImage`. This can speed up rendering, and affords the flexibility of rendering cards into a `UIImageView`.

![Card Images](https://user-images.githubusercontent.com/622192/53522613-008a1480-3a98-11e9-8388-8ca599848277.png)

## CardTableViewController

Render grouped `UITableView` sections using `PartialCardView` under the hood to draw cell background views.

![Card Table](https://user-images.githubusercontent.com/622192/53522713-3b8c4800-3a98-11e9-98c1-1935046e6678.png)

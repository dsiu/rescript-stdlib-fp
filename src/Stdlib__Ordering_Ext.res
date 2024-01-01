// convert compare functions of Core Ordering (float) to compare functions of Belt (Int)
let toInt = n => n->RescriptCore.Ordering.isLess ? -1 : n->RescriptCore.Ordering.isGreater ? 1 : 0

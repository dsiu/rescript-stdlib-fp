// convert compare functions of Core Ordering (float) to compare functions of Belt (Int)
let toInt = n => n->Ordering.isLess ? -1 : n->Ordering.isGreater ? 1 : 0

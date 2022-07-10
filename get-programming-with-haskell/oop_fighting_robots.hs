robot :: ([Char], Integer, Integer) -> (([Char], Integer, Integer) -> t) -> t
robot (name, attck, hp) message = message (name, attck, hp)

killerRobot = robot ("Killer3", 25, 200)

name (n, _, _) = n

attack (_, a, _) = a

hp (_, _, hp) = hp

setName aRobot newName = aRobot (\(n, a, h) -> robot (newName, a, h))

setAttack aRobot newAttack = aRobot (\(n, a, h) -> robot (n, newAttack, h))

setHP aRobot newHP = aRobot (\(n, a, h) -> robot (n, a, newHP))

-- Prototype-based OOP

nicerRobot = setName killerRobot "kitty"

gentlerRobot = setAttack killerRobot 5

softerRobot = setHP killerRobot 50

printRobot aRobot = aRobot (\(n, a, h) -> n ++ " attack:" ++ show a ++ " hp:" ++ show h)

damage aRobot attackDamage = aRobot (\(n, a, h) -> robot (n, a, h - attackDamage))

data Persona = Persona String Int

nombre:: Persona ->String
nombre (Persona name _) = name

factorial :: Int->Int
factorial 0 = 1
factorial n = n * factorial (n-1)

fibonacci :: Int->Int
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

largo :: [a] -> Int
largo [] = 0
largo (_:xs) = 1 + largo xs

sumalista :: Num a => [a] -> a
sumalista [] = 0
sumalista (x:xs) = x + sumalista xs
rotar :: [a]->[a]
rotar lista = (tail.(++).head) lista

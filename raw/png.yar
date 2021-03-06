/*
    Description: This finds the magics on dump files, like raw dd image.
    Disclaimer: This can though false positives.

    Contributors:
      - Jaume Martin <@Xumeiquer>
      - Joan Bono <@joan_bono>
*/

rule png: PNG
{
    meta:
        author = "Joan Bono"

    strings:
        $a = { 89 50 4E 47 0D 0A 1A 0A }
        $b = { 49 48 44 52 }
        $c = { 49 44 41 54 }
        $d = { 49 45 4E 44 }

    condition:
        $a and for any of ($b, $c): (@ > @a) and $d
}

rule mng: PNG
{
    meta:
      author = "Joan Bono"

    strings:
        $a = { 8A 4D 4E 47 0D 0A 1A 0A }
        $b = { 49 45 4E 44 }

    condition:
        $a and $b and (@b > @a)
}

rule jng: PNG
{
    meta:
        author = "Joan Bono"

    strings:
        $a = { 8B 4A 4E 47 0D 0A 1A 0A }
        $b = { 49 45 4E 44 }

    condition:
       $a and $b and (@b > @a)
}

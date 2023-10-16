//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Automatically levels the character to 15
using their package
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "X2_Q2A1Prologue", 1);
    int nCurrentLevel = GetHitDice(oPC);
    int i = 1;
    //SetXP(oPC, 105100);

    // ************************************
    // * Calculate whether a package should
    // * be used
    // ************************************
    int nPackage = GetCreatureStartingPackage(oPC);
    int nSpecialPackage = FALSE;
    int bFail = FALSE;
    int nOtherClass = CLASS_TYPE_INVALID;
    int nOtherPackage = PACKAGE_INVALID;

    if (nPackage >= 90 && nPackage <=100)
    {
        switch (nPackage)
        {
            case 90:   nOtherClass = CLASS_TYPE_BLACKGUARD; break;
            case 91:   nOtherClass = CLASS_TYPE_HARPER; break;
            case 92:   nOtherClass = CLASS_TYPE_DIVINECHAMPION; break;
            case 93:   nOtherClass = CLASS_TYPE_SHIFTER; break;
            case 94:   nOtherClass = CLASS_TYPE_WEAPON_MASTER; break;
            case 95:   nOtherClass = CLASS_TYPE_ASSASSIN; break;
            case 96:   nOtherClass = CLASS_TYPE_DIVINECHAMPION; break;
            case 97:   nOtherClass = CLASS_TYPE_ARCANE_ARCHER; break;
            case 98:   nOtherClass = CLASS_TYPE_SHADOWDANCER; break;
            case 99:   nOtherClass = CLASS_TYPE_DRAGONDISCIPLE; break;
            case 100:   nOtherClass = CLASS_TYPE_PALEMASTER; break;
        }

        nSpecialPackage = TRUE;
        nOtherPackage =  nPackage + 28;
    }

    for (i=1; i <= 15 - nCurrentLevel; i++)
    {
        // * if Special-Package is true then try
        // * to levelup prestige class class
        if (nSpecialPackage == TRUE)
        {
            bFail = LevelUpHenchman(oPC, nOtherClass, TRUE, nOtherPackage);
        }
        if (bFail == FALSE)
        {
            // * Must try all three classes if the first fails
            // * i.e., a Paladin who became a blackguard would not
            // * be able to levelup in their paladin class anymore.
             bFail = LevelUpHenchman(oPC, CLASS_TYPE_INVALID, TRUE);
            if (bFail == 0)
            {
                bFail = LevelUpHenchman(oPC, GetClassByPosition(2, oPC), TRUE);
                if (bFail == 0)
                {
                    bFail = LevelUpHenchman(oPC, GetClassByPosition(3, oPC), TRUE);
                }
            }
            // * reset bfail
            bFail = FALSE;
        }
    }
}

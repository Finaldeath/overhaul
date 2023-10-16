#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();
    object oTemp;
    location lTemp1,lTemp2;

    if (GetIsPossessedFamiliar(oPC))
    {
        UnpossessFamiliar(oPC);
    }
    else if (GetIsPC(oPC))
    {
        if (GetIsPossessedFamiliar(oPC) == TRUE)
        {
            oTemp = oPC;
            UnpossessFamiliar(oPC);
            oPC = GetMaster(oTemp);
            lTemp1 = GetLocation(oPC);
            AssignCommand(oTemp, JumpToLocation(lTemp1));
        }

        string sConv = GetTag(OBJECT_SELF);
        string sFade = GetStringLeft(GetName(OBJECT_SELF), 4);
        int nFade = FALSE;

        if (sFade == "FADE")
            nFade = TRUE;

        AssignCommand(oPC, ClearAllActions(TRUE));
        BeginCutscene(oPC, sConv, nFade);
    }
}

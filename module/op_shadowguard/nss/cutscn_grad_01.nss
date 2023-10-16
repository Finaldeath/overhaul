#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if ((GetIsPC(oPC) == TRUE)  && (GetIsPossessedFamiliar(oPC) != TRUE))
    {
        string sConv = GetTag(OBJECT_SELF);

        string sFade = GetStringLeft(GetName(OBJECT_SELF), 4);

        int nFade = FALSE;

        if (sFade == "FADE")
            nFade = TRUE;

        BeginCutscene(oPC, sConv, nFade);

        //Ensure the player is facing the right direction
        object oWP = GetNearestObjectByTag("WP_ST_0_TRUE_BEGIN");
        AssignCommand(oPC, SetFacing(GetFacing(oWP)));
    }
}

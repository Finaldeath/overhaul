#include "NW_I0_Generic"
void main()
{
    if(GetLocalInt(GetModule(),"ADMITTED_TO_MELDANEN_ESTATE") == FALSE &&
       GetLocalInt(OBJECT_SELF,"NW_L_Opened") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Opened",TRUE);
        object oGuard = GetNearestObjectByTag("M1Q3AMeldGuard");
        object oEnc = GetNearestObjectByTag("ENC_M1Q3AGate");
        AdjustReputation(GetLastOpenedBy(),oGuard,-100);
        AssignCommand(oGuard,DetermineCombatRound());

        if(GetLocalInt(oEnc,"NW_L_Fired") == FALSE)
        {
            SetEncounterActive(TRUE,oEnc);
        }
    }
}

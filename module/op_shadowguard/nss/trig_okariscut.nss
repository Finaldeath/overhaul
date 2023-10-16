#include "help_hench"

void CreateClone (object oPC, location lLoc);

void main()
{
    object oPC = GetEnteringObject();
    object oTemp;
    effect eInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
    object oWP = GetNearestObjectByTag("WP_CUTSCENE", oPC);
    float fWP = GetFacing(oWP);
    int iDoOnce = GetLocalInt(GetModule(), "trig_okariscut");
    location lTemp1 = GetLocation(oPC);

    if(iDoOnce != TRUE)
    {
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

            AssignCommand(oPC, ClearAllActions(TRUE));
            SetCutsceneMode(oPC, TRUE);
            FadeToBlack(oPC);
            SetLocalString(oPC, "S_CURR_CUTSCENE", sConv);
            SetLocalInt(GetModule(), "trig_okariscut", TRUE);

            DelayCommand(1.5, CreateClone(oPC, lTemp1));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eInvis,oPC));
            DelayCommand(1.5, AssignCommand(oPC, JumpToLocation(GetLocation(oWP))));
            DelayCommand(1.7, AssignCommand(oPC, SetCameraFacing(fWP, 10.0, 60.0f)));
            DelayCommand(1.8, AssignCommand(oPC, ActionStartConversation(oPC, sConv, TRUE, FALSE)));
            DelayCommand(2.0, FadeFromBlack(oPC));

        }
    }
}

void CreateClone (object oPC, location lLoc)
{
    CopyObject(oPC, lLoc, OBJECT_INVALID, "SG_OKARISCUTCLONE");
}

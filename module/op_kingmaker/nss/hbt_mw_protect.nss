//::///////////////////////////////////////////////
//:: hbt_mw_protect
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    HAMMER FIX
    Force the PC to be in the same area as the light
    and in conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Dec 2004
//:://////////////////////////////////////////////

void main()
{
    object oSelf = GetObjectByTag("q3ai_mw_intro");
    object oPC = GetFirstPC();

    object oAreaSelf = GetArea(oSelf);
    object oAreaPC = GetArea(oPC);

    int iDeBounce = GetLocalInt(OBJECT_SELF, "DEBOUNCE_CHK");

    if ((GetIsObjectValid(oSelf) == TRUE)
      && (GetTag(oAreaSelf) != "EmptBattleFeild"))
    {
        PrintString("**hbt_mw_protect2 firing");

        if (oAreaSelf != oAreaPC)
        {
            if (iDeBounce == FALSE)
            {
                SetLocalInt(OBJECT_SELF, "DEBOUNCE_CHK", TRUE);
            }
            else
            {
                PrintString("***PC and Shaft of Light in different areas.");

                SetCommandable(TRUE, oPC);
                DelayCommand(0.5f, AssignCommand(oPC, ClearAllActions(TRUE)));
                DelayCommand(1.0f, AssignCommand(oPC, ActionJumpToObject(oSelf)));
                DelayCommand(1.1f, SetCommandable(FALSE, oPC));

                SetLocalInt(OBJECT_SELF, "DEBOUNCE_CHK", FALSE);
            }
        }
        else if (IsInConversation(oPC) != TRUE)
        {
            if (iDeBounce == FALSE)
            {
                SetLocalInt(OBJECT_SELF, "DEBOUNCE_CHK", TRUE);
            }
            else
            {
                PrintString("***PC and Shaft of Light not in conversation.");

                SetCommandable(TRUE, oPC);
                AssignCommand(oPC, ClearAllActions(TRUE));
                AssignCommand(oPC, ActionForceMoveToObject(oSelf, TRUE, 0.0f, 1.0f));
                DelayCommand(1.1f, AssignCommand(oSelf, ActionStartConversation(oPC)));
                DelayCommand(1.1f, SetCommandable(FALSE, oPC));

                SetLocalInt(OBJECT_SELF, "DEBOUNCE_CHK", FALSE);
            }
        }
    }
    else if ((GetCutsceneMode(oPC) == FALSE) && (GetTag(oAreaPC) != "q3k3"))
    {
        if (GetPlotFlag(oPC) == TRUE)
        {
            if (iDeBounce == FALSE)
            {
                SetLocalInt(OBJECT_SELF, "DEBOUNCE_CHK", TRUE);
            }
            else
            {
                PrintString("***PC was plot and not in cutscene, values adjusted.");
                SetPlotFlag(oPC, FALSE);

                SetLocalInt(OBJECT_SELF, "DEBOUNCE_CHK", FALSE);
            }
        }
        if (GetCommandable(oPC) == FALSE)
        {
            if (iDeBounce == FALSE)
            {
                SetLocalInt(OBJECT_SELF, "DEBOUNCE_CHK", TRUE);
            }
            else
            {
                PrintString("***PC was not commandable and not in cutscene, values adjusted.");
                SetCommandable(TRUE, oPC);

                SetLocalInt(OBJECT_SELF, "DEBOUNCE_CHK", FALSE);
            }
        }
    }
}

//::///////////////////////////////////////////////
//:: Name hx_end_movie
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will fire the ending conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 1, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    // * flood area with tiles
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        //SetCommandable(TRUE, oPC);
        FadeFromBlack(oPC, FADE_SPEED_FASTEST);
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        DelayCommand(0.1, AssignCommand(oPC, ClearAllActions(TRUE)));
        DelayCommand(0.3, AssignCommand(oPC, ActionStartConversation(OBJECT_SELF, "h10_narrator")));
    }
}

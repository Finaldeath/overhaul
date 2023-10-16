//::///////////////////////////////////////////////
//:: Name cutabort116
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of Zesyyr's triumphant arrival
    Cut to dialog between Zesyyr and PC

*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Sept 26/03
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    SetLocalInt(GetModule(), "X2_Cutscene116Aborted", 1);
    BlackScreen(oPC);
    // Cutscene actors and objects.
    object oSeer = GetObjectByTag("q2amaematron");
    AssignCommand(oSeer, SetIsDestroyable(TRUE));

    object oZesyyr = GetObjectByTag("q2amaezesyyr");
    object oZesGuard1 = GetObjectByTag("q2azesguard1");
    object oZesGuard2 = GetObjectByTag("q2azesguard2");
    object oGuard1 = GetObjectByTag("cut108_guard1");
    object oGuard2 = GetObjectByTag("cut108_guard2");
    object oGuard3 = GetObjectByTag("cut108_guard3");
    object oGuard4 = GetObjectByTag("cut108_guard4");

    //locations
    object oGuard1_1 = GetWaypointByTag("cut116wp_guard1_1");
    object oGuard2_1 = GetWaypointByTag("cut116wp_guard2_1");
    object oGuard3_1 = GetWaypointByTag("cut116wp_guard3_1");
    object oGuard4_1 = GetWaypointByTag("cut116wp_guard4_1");
    object oZesStart = GetWaypointByTag("cut116wp_zesstart");

    AssignCommand(oZesyyr, JumpToObject(oSeer));

    AssignCommand(oSeer, SetIsDestroyable(TRUE));
    DestroyObject(oSeer);


    DelayCommand(0.5, AssignCommand(oPC, ClearAllActions(TRUE)));
    DelayCommand(0.75, AssignCommand(oZesyyr, ActionStartConversation(oPC, "q2azesyyrcut")));

    AssignCommand(oZesGuard1, JumpToObject(oZesStart));
    AssignCommand(oZesGuard2, JumpToObject(oZesStart));
    DelayCommand(1.0, AssignCommand(oZesGuard1, ActionMoveToObject(oSeer, FALSE, 4.0)));
    DelayCommand(1.0, AssignCommand(oZesGuard2, ActionMoveToObject(oSeer, FALSE, 4.0)));


    //Other guards walk to Zesyyr and bow to her
    AssignCommand(oGuard1, ActionMoveToObject(oGuard1_1));
    AssignCommand(oGuard2, ActionMoveToObject( oGuard2_1));
    AssignCommand(oGuard3, ActionMoveToObject(oGuard3_1));
    AssignCommand(oGuard4, ActionMoveToObject(oGuard4_1));

    vector vZessyr = GetPosition(oZesyyr);
    DelayCommand(6.0, AssignCommand(oGuard1, SetFacingPoint(vZessyr)));
    DelayCommand(8.0, AssignCommand(oGuard1, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 30.0)));

    DelayCommand(6.0, AssignCommand(oGuard2, SetFacingPoint(vZessyr)));
    DelayCommand(9.0, AssignCommand(oGuard1, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 30.0)));

    DelayCommand(6.0, AssignCommand(oGuard3, SetFacingPoint(vZessyr)));
    DelayCommand(10.0, AssignCommand(oGuard1, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 30.0)));

    DelayCommand(6.0, AssignCommand(oGuard4, SetFacingPoint(vZessyr)));
    DelayCommand(8.5, AssignCommand(oGuard1, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 30.0)));

    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));



}



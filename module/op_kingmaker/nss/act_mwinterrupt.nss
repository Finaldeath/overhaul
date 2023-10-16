void main()
{
    object oPC = GetFirstPC();
    object oIllithid = GetNearestObjectByTag("KM_TRICKLIGHT", oPC);
    location lPC = GetLocation(oPC);

    ActionPauseConversation();

    AssignCommand(oIllithid, DoPlaceableObjectAction(OBJECT_SELF, ANIMATION_PLACEABLE_DEACTIVATE));
    CreateObject(OBJECT_TYPE_PLACEABLE, "q3ai_mw_intro", lPC, FALSE);

    DelayCommand(1.0f, ActionResumeConversation());
}

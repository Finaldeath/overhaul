void main()
{
    ActionDoCommand(SetEncounterActive(TRUE,GetNearestObjectByTag("ENC_M1Q4FGuards")));
    ActionForceMoveToObject(GetNearestObjectByTag("WP_M1Q4F_M1Q4G"),TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}

void main()
{
    if (GetIsPC(GetEnteringObject()) && GetLocalInt(OBJECT_SELF,"NW_L_MoveKasma") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_MoveKasma",10);
        AssignCommand(GetNearestObjectByTag("M2Q05CKASMA"),SetLocalInt(OBJECT_SELF,"NW_L_Dungeon",10));
        AssignCommand(GetNearestObjectByTag("M2Q05CKASMA"),JumpToLocation(GetLocation(GetWaypointByTag("WP_KASMA_MOVE_DUN"))));
    }
}

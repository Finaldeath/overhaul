void main()
{
    if(GetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q4DCockInBox"))
    {
        object oCock = CreateObject(OBJECT_TYPE_CREATURE,
                                    "M1Q4DCOCKATRICE",
                                    GetLocation(OBJECT_SELF));
        AssignCommand(oCock,ActionAttack(GetLastUsedBy()));
        SetIsDestroyable(TRUE);
        DestroyObject(OBJECT_SELF);
    }
}

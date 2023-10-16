// destroy trap when there are no statues

void main()
{
    object oPC = GetClickingObject();
    object oGarg = GetNearestObjectByTag("Q3B_STATUE_TRAP");
    if(oGarg == OBJECT_INVALID || GetDistanceBetween(OBJECT_SELF, oGarg) > 20.0)
        DestroyObject(OBJECT_SELF);
}

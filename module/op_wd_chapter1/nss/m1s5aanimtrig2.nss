void main()
{
    object oEnter = GetEnteringObject();
    if(GetRacialType(oEnter) == RACIAL_TYPE_ANIMAL &&
       GetIsObjectValid(GetMaster(oEnter)) == FALSE)
    {
        AssignCommand(oEnter,ClearAllActions());
        AssignCommand(oEnter,ActionJumpToObject(GetWaypointByTag("WP_M1S5BAnim")));

    }
}

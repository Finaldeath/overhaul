// Restores any henchmen that were removed during the trial at the temple

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    object oObject = GetFirstObjectInArea(GetArea(OBJECT_SELF));
    while(oObject != OBJECT_INVALID)
    {
        if(GetLocalInt(oObject, "Q6_REMOVED_AT_TEMPLE") == 1)
        {
            AddHenchman(oPC, oObject);
            SetCommandable(TRUE, oObject);
            SetLocalInt(oObject, "Q6_REMOVED_AT_TEMPLE", 0);
        }
        oObject = GetNextObjectInArea(GetArea(OBJECT_SELF));
    }
}

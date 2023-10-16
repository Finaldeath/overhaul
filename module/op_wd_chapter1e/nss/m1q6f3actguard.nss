void main()
{
    if(GetIsPC(GetEnteringObject()) &&
       GetIsObjectValid(GetItemPossessedBy(GetNearestObjectByTag("M1Q6F3Altar"),"M1Q6FHelmGem")) == FALSE)
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q6F2_GuardActive",TRUE);
    }
}

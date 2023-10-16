void main()
{
    object oPC = GetLastOpenedBy();
    // * July 2 2002: Checkign to see if puff in chest
    // * if so already then don't spawn
    if (GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M1S03IFOG")) == FALSE)
    {
        if(GetIsObjectValid(GetItemPossessedBy(oPC,"M1S03IFOG")) == FALSE &&
            (GetLevelByClass(CLASS_TYPE_BARD,oPC) > 0 ||
             GetLevelByClass(CLASS_TYPE_SORCERER,oPC) > 0 ||
             GetLevelByClass(CLASS_TYPE_WIZARD,oPC) > 0) )
        {
            CreateItemOnObject("M1S03IFOG",OBJECT_SELF);
        }
    }
}

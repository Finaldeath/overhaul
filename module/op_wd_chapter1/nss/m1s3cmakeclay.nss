void main()
{
    object oPC = GetLastOpenedBy();
    if( GetIsObjectValid(GetItemPossessedBy(oPC,"M1S03ICLAY")) == FALSE &&
        (GetLevelByClass(CLASS_TYPE_BARD,oPC) > 0 ||
         GetLevelByClass(CLASS_TYPE_SORCERER,oPC) > 0 ||
         GetLevelByClass(CLASS_TYPE_WIZARD,oPC) > 0) )
    {
        CreateItemOnObject("M1S03ICLAY",OBJECT_SELF);
    }
}

#include "help_hench"

void RetrieveInv(object oHench, object oMer)
{
    object o = GetFirstItemInInventory(oMer);

    while(o != OBJECT_INVALID)
    {
        CreateItemOnObject(GetResRef(o), oHench, GetNumStackedItems(o));

        DestroyObject(o);

        o = GetNextItemInInventory(oMer);
    }
}

void main()
{
    object oHench = OBJECT_SELF;

    object oPC = GetPCSpeaker();

    location l = GetLocation(oHench);

    object oMer = GetObjectByTag("MT_" + GetTag(oHench));

    AssignCommand(oMer, JumpToLocation(l));

    DelayCommand(1.0, RetrieveInv(oHench, oMer));
}

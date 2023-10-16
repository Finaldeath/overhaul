#include "help_hench"

void DumpInv(object oHench, object oMer)
{
    object o = GetFirstItemInInventory(oHench);

    while(o != OBJECT_INVALID)
    {
        CreateItemOnObject(GetResRef(o), oMer, GetNumStackedItems(o));

        DestroyHenchObject(o);

        o = GetNextItemInInventory(oHench);
    }
}

void main()
{
    object oHench = OBJECT_SELF;

    object oPC = GetPCSpeaker();

    location l = GetLocation(oHench);

    object oMer = GetObjectByTag("MT_" + GetTag(oHench));

    AssignCommand(oMer, JumpToLocation(l));

    DelayCommand(1.0, DumpInv(oHench, oMer));
}

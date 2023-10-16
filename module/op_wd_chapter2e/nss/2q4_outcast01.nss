#include "NW_I0_Plot"
#include "NW_J_FETCH"
void main()
{
    SetLocalInt(Global(), "NW_J_FETCHPLOT", 99);

    if (PlayerHasFetchItem(GetPCSpeaker()) == TRUE)
    {
        TakeFetchItem(GetPCSpeaker());
    }

    object oLever = GetItemPossessedBy(OBJECT_SELF,"2Q4_LEVERWATER");
    object oKey = GetItemPossessedBy(OBJECT_SELF,"2Q4F_MachKey");
    if(GetIsObjectValid(oLever))
    {
        DestroyObject(oLever);
        CreateItemOnObject("2q4f_machkey",GetPCSpeaker());
    }
    if(GetIsObjectValid(oKey))
    {
        DestroyObject(oKey);
        CreateItemOnObject("2q4_leverwater",GetPCSpeaker());
    }
    CreateItemOnObject("2Q4F_GhoulAmu", OBJECT_SELF);
    RewardXP("m2q4_Ghouls",100,GetPCSpeaker());
}

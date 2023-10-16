// * Takes eggs from player
#include "m3plotinclude"
void main()
{
    SetLocalInt(GetModule(), "NW_G_M3Q04PLOTKLAUTH", 99);
    SetLocalObject(OBJECT_SELF, "M3Q04CKLAUTHPLOT", GetPCSpeaker());
    ////  Take eggs away, give player Word of Power
    CreateItemOnObject("M3Q04H07_Lock", GetPCSpeaker());
    TakeEggs(GetPCSpeaker());
    AddJournalQuestEntry("M3Q04_H07_KLAU",20,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q4HC_1EGG",1);
}

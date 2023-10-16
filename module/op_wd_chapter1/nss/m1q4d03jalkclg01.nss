int StartingConditional()
{
   int bCondition = GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF),
                                                    "NW_G_M1Q4D03WonContest")) == FALSE &&
                    GetTag(GetItemInSlot(INVENTORY_SLOT_CHEST,
                                         GetPCSpeaker())) == "NW_CLOTH029";
   return bCondition;
}

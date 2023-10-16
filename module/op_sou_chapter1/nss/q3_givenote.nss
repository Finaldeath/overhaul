// Glendir gives the promissary note to the PC

void main()
{
    object oNote = GetItemPossessedBy(OBJECT_SELF, "q3_promissary");
    if (GetIsObjectValid(oNote))
    {
        ActionGiveItem(oNote, GetPCSpeaker());
    }
}

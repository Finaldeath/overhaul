// destroy all zombies if getting in while ANY player has the rod (so they would not interfer with the dialog
void DoSaveGame()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    if(GetItemPossessedBy(oPC, "q2_rod_blight") == OBJECT_INVALID)
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SAVE_GAME_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SAVE_GAME_ONCE", 1);
    DoSinglePlayerAutoSave();

}

void main()
{
    DoSaveGame();
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    object oPlayer = GetFirstPC();
    while(oPlayer != OBJECT_INVALID)
    {
        if(GetItemPossessedBy(oPlayer, "q2_rod_blight") != OBJECT_INVALID)
        {
            int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_DEST_UNDEAD_ONCE");
            if(nDoOnce == 1)
                return;
            SetLocalInt(OBJECT_SELF, "DO_DEST_UNDEAD_ONCE", 1);
            // destroy all zombies
            object oZombie = GetFirstObjectInArea(OBJECT_SELF);
            while(oZombie != OBJECT_INVALID)
            {
                if(GetTag(oZombie) == "NW_ZOMBIE01" || GetTag(oZombie) == "NW_ZOMBIE02")
                    DestroyObject(oZombie);
                oZombie = GetNextObjectInArea(OBJECT_SELF);
            }
            return;
        }
        oPlayer = GetNextPC();
    }
}

// flag player as entered the oasis: needed to determine starting location

void DoAliTalk(object oPC)
{
    int nDoTalk = GetLocalInt(GetModule(), "Q2A_SET_ALI_TO_TALK");
    if(nDoTalk == 0) // this var is set by kel-garas when he teleports the player outside
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ALI_TALK_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ALI_TALK_ONCE", 1);
    object oAli = GetObjectByTag("Q2A_ALI");
    AssignCommand(oAli, ActionStartConversation(oPC));
}

void DoKatrianaTalk(object oPC)
{
    int nDoOnce = GetLocalInt(GetModule(), "Q2A_DO_KATRIANA_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetModule(), "Q2A_DO_KATRIANA_ONCE", 1);

    object oKatriana = GetObjectByTag("Q2_KATRIANA");
    AssignCommand(oKatriana, ActionStartConversation(oPC));

}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC)) // good for DMs also
        return;
    SetLocalInt(oPC, "X1_ENTRED_OASIS", 1);

     // destroy all remaining zombies, so the bedines won't attack them
    object oPlayer = GetFirstPC();
    while(oPlayer != OBJECT_INVALID)
    {
        if(GetItemPossessedBy(oPlayer, "q2_rod_blight") != OBJECT_INVALID)
        {
            int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_DEST_UNDEAD_ONCE");
            if(nDoOnce == 1)
                break;

            SetLocalInt(OBJECT_SELF, "DO_DEST_UNDEAD_ONCE", 1);
            // destroy all zombies
            object oZombie = GetFirstObjectInArea(OBJECT_SELF);
            while(oZombie != OBJECT_INVALID)
            {
                if(GetTag(oZombie) == "NW_ZOMBIE01" || GetTag(oZombie) == "NW_ZOMBIE02")
                    DestroyObject(oZombie);
                oZombie = GetNextObjectInArea(OBJECT_SELF);
            }
            break;
        }
        oPlayer = GetNextPC();
    }

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_HENCHMEM_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_HENCHMEM_ONCE", 1);

    DoKatrianaTalk(oPC);

    object oDeekin = GetObjectByTag("x0_hen_dee");
    object oDorna = GetObjectByTag("x0_hen_dor");
    object oXanos = GetObjectByTag("x0_hen_xan");

    object oDeekinWP = GetWaypointByTag("Q2A_WP_DEEKIN");
    object oDornaWP = GetWaypointByTag("Q2A_WP_DORNA");
    object oXanosWP = GetWaypointByTag("Q2A_WP_XANOS");

    // jump a henchman only if he is not hired
    AssignCommand(oDeekin, JumpToObject(oDeekinWP));
    AssignCommand(oDorna, JumpToObject(oDornaWP));
    AssignCommand(oXanos, JumpToObject(oXanosWP));

    DoAliTalk(oPC);



}

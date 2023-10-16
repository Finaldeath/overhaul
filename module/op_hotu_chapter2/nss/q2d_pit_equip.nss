///Take 100 gold from player
///Equip players thrall with armor and good sword


void main()
{
    TakeGoldFromCreature(100,GetPCSpeaker());
    //Equip thrall in fighting ring with good sword
    //and good armor. This equipment is only used for
    //one fight.
    SetLocalInt(GetModule(), "X2_Q2DEquipPitSlave", 1);
}

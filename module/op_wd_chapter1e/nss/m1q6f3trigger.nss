void main()
{
    object oPC = GetEnteringObject();
    if ( GetIsObjectValid(oPC) &&
         //GetIsEnemy(oPC) &&
         GetTag(GetItemInSlot(INVENTORY_SLOT_CHEST,oPC)) != "M1AllHelmUniform" &&
         GetLocalInt(OBJECT_SELF,"NW_L_M1Q6F4Triggered") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_M1Q6F4Triggered",TRUE);
        int nNth = 1;
        object oDoor = GetNearestObjectByTag("M1Q6F3Door",OBJECT_SELF,nNth);
        while (GetIsObjectValid(oDoor))
        {
            PrintString("Aidan-Found Door");
            AssignCommand(oDoor,ActionOpenDoor(OBJECT_SELF));
            nNth++;
            oDoor = GetNearestObjectByTag("M1Q6F3Door",OBJECT_SELF,nNth);
        }
        
     /*   nNth = 1;
        object oZombie = GetNearestObjectByTag("M1Q6F3Zombie",OBJECT_SELF,nNth);
        while (GetIsObjectValid(oZombie))
        {
            PrintString("Aidan-Found Zombies " + IntToString(nNth));
            AssignCommand(oZombie,ActionAttack(oPC));
            nNth++;
            GetNearestObjectByTag("M1Q6F3Zombie",OBJECT_SELF,nNth);
        }*/
    }
}

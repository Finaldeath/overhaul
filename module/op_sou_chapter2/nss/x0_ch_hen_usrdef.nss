//::///////////////////////////////////////////////
//:: Ch2 Henchman (UserDefined)
//:: x0_ch_hen_usrdef.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     A Ch2 override script to handle plot items
     that have been given to the associate
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 25, 2003
//:://////////////////////////////////////////////

void main()
{
    int iUDNum = GetUserDefinedEventNumber();

    //User-Defined OnSpawn (100)
    if (iUDNum == 100)
    {

    }

    //User-Defined OnHeartbeat (1001)
    if (iUDNum == 1001)
    {

    }

    //User-Defined OnPerceive (1002)
    if (iUDNum == 1002)
    {

    }

    //User-Defined OnAttacked (1005)
    if (iUDNum == 1005)
    {

    }

    //User-Defined OnDamaged (1006)
    if (iUDNum == 1006)
    {

    }

    //User-Defined OnDeath (1007)
    if (iUDNum == 1007)
    {
        //Search their inventory
        object oItem = GetFirstItemInInventory(OBJECT_SELF);
        while (oItem != OBJECT_INVALID)
        {
            //Check to see if it's a plot item
            int bPlot = GetPlotFlag(oItem);
            if (bPlot == TRUE)
            {
                string sItem = GetTag(oItem);
                if (sItem == "ScarabKey")//Scarab Key (Undrentide)
                {
                    //Unlock the associated doors
                    object oDoorA = GetObjectByTag("Crypt_01A_Crypt_02A");
                    object oDoorB = GetObjectByTag("Crypt_01B_Crypt_02B");
                    SetLocked(oDoorA, FALSE);
                    SetLocked(oDoorB, FALSE);
                    //Destroy item
                    DestroyObject(oItem);
                }
                else if (sItem == "GolemMakersRing")//Golem Maker's Ring (Undrentide)
                {
                    //Copy it into Ashtara's Store
                    object oStore = GetObjectByTag("AshtaraStore");
                    SetPlotFlag(oItem, FALSE);
                    CopyItem(oItem, oStore);
                    //Destroy original
                    DestroyObject(oItem);
                }
                else if (sItem == "Key_Crypt_01")//Crypt - 1st Floor Key
                {
                    //Unlock the associated door
                    object oDoor = GetObjectByTag("AsabiDoor");
                    SetLocked(oDoor, FALSE);
                    //Destroy item
                    DestroyObject(oItem);
                }
                else if (sItem == "Library_Pen") //Library - Quill Pen
                {
                    //Unlock the associated door
                    object oDoor = GetObjectByTag("Library_PenDoor");
                    SetLocked(oDoor, FALSE);
                    //Add it to the Pillar Wall Safe in the Library
                    object oWallSafe = GetObjectByTag("PenInkHolder");
                    CopyItem(oItem, oWallSafe);
                    //Destroy original
                    DestroyObject(oItem);
                }
                else if (sItem == "Library_Inkwell")//Library - Inkwell
                {
                    //Unlock the associated door
                    object oDoor = GetObjectByTag("Library_InkDoor");
                    SetLocked(oDoor, FALSE);
                    //Add it to the Pillar Wall Safe in the Library
                    object oWallSafe = GetObjectByTag("PenInkHolder");
                    CopyItem(oItem, oWallSafe);
                    //Destroy original
                    DestroyObject(oItem);
                }
                else if (sItem == "PortableDoor")//Arcanists' - Portable Door
                {
                    //Copy it into Ashtara's Store
                    object oStore = GetObjectByTag("AshtaraStore");
                    SetPlotFlag(oItem, FALSE);
                    CopyItem(oItem, oStore);
                    //Destroy original
                    DestroyObject(oItem);
                }
                else if (sItem == "GiantFlesh")//Winds - Shank of Meat
                {
                    //Copy it into one of the original Meat Holders
                    object oHolder = GetObjectByTag("MeatHolder");
                    CopyItem(oItem, oHolder);
                    //Destroy original
                    DestroyObject(oItem);
                }
                else if (sItem == "ITEM_DarkWind" || //The Three Winds
                         sItem == "ITEM_DeadWind" ||
                         sItem == "ITEM_WiseWind")
                {
                    //Add it to the Ark of the Three Winds
                    object oArk = GetObjectByTag("ArkOfWinds");
                    CopyItem(oItem, oArk);
                    //Destroy original
                    DestroyObject(oItem);
                }
            }

            //Update the loop variable
            oItem = GetNextItemInInventory(OBJECT_SELF);
        }
    }

    //User-Defined OnDisturbed (1008)
    if (iUDNum == 1008)
    {

    }

    //User-Defined OnCombatRoundEnd (1003)
    if (iUDNum == 1003)
    {

    }

    //User-Defined OnDialog (1004)
    if (iUDNum == 1004)
    {

    }

    return;
}

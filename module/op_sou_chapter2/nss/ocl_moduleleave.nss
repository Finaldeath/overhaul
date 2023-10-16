//::///////////////////////////////////////////////
//:: Module Event (OnClientLeave)
//:: OCL_ModuleLeave.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle any plot items the exiting player
     might have.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 25, 2003
//:://////////////////////////////////////////////

void main()
{
    //Search their inventory
    object oPC = GetExitingObject();
    object oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID)
    {
        //Check to see if it's a plot item
        int bPlot = GetPlotFlag(oItem);
        if (bPlot == TRUE)
        {

            string sItem = GetTag(oItem);
            if (sItem == "ScarabKey")//Scarab Key (Undrentide)
            {
                //Unlock the associated door
                object oDoor = GetObjectByTag("AsabiDoor");
                SetLocked(oDoor, FALSE);
                //Destroy item
                DestroyObject(oItem);
            }
            else if (sItem == "GolemMakersRing")//Golem Maker's Ring (Undrentide)
            {
                //Copy it into Ashtara's Store
                object oStore = GetObjectByTag("AshtaraStore");
                SetPlotFlag(oItem, FALSE);
                CreateItemOnObject(sItem, oStore);
                //Destroy original
                DestroyObject(oItem);
            }
            else if (sItem == "Key_Crypt_01")//Crypt - 1st Floor Key
            {
                //Unlock the associated doors
                object oDoorA = GetObjectByTag("Crypt_01A_Crypt_02A");
                object oDoorB = GetObjectByTag("Crypt_01B_Crypt_02B");
                SetLocked(oDoorA, FALSE);
                SetLocked(oDoorB, FALSE);
                //Destroy item
                DestroyObject(oItem);
            }
            else if (sItem == "Library_Pen") //Library - Quill Pen
            {
                //Unlock the associated door
                object oDoor = GetObjectByTag("Library_PenDoor");
                SetLocked(oDoor, FALSE);
                //Add it to the Pillar Wall Safe in the Library (unless it's
                //already there)
                object oWallSafe = GetObjectByTag("PenInkHolder");
                object oDuplicate = GetItemPossessedBy(oWallSafe, sItem);
                if (oDuplicate == OBJECT_INVALID)
                {
                    CreateItemOnObject(sItem, oWallSafe);
                }
                //Destroy original
                DestroyObject(oItem);
            }
            else if (sItem == "Library_Inkwell")//Library - Inkwell
            {
                //Unlock the associated door
                object oDoor = GetObjectByTag("Library_InkDoor");
                SetLocked(oDoor, FALSE);
                //Add it to the Pillar Wall Safe in the Library (unless it's
                //already there)
                object oWallSafe = GetObjectByTag("PenInkHolder");
                object oDuplicate = GetItemPossessedBy(oWallSafe, sItem);
                if (oDuplicate == OBJECT_INVALID)
                {
                    CreateItemOnObject(sItem, oWallSafe);
                }
                //Destroy original
                DestroyObject(oItem);
            }
            else if (sItem == "PortableDoor")//Arcanists' - Portable Door
            {
                //Copy it into Ashtara's Store
                object oStore = GetObjectByTag("AshtaraStore");
                SetPlotFlag(oItem, FALSE);
                CreateItemOnObject("portabledoor2", oStore);
                //Inform all PCs
                object oPlayer = GetFirstPC();
                while (oPlayer != OBJECT_INVALID)
                {
                    FloatingTextStrRefOnCreature(83290, oPlayer, FALSE);
                    oPlayer = GetNextPC();
                }

                //Destroy original
                DestroyObject(oItem);
            }
            else if (sItem == "GiantFlesh")//Winds - Shank of Meat
            {
                //Copy it into one of the original Meat Holders
                object oHolder = GetObjectByTag("MeatHolder");
                CreateItemOnObject(sItem, oHolder);
                //Destroy original
                DestroyObject(oItem);
            }
            else if (sItem == "ITEM_DarkWind" || //The Three Winds
                     sItem == "ITEM_DeadWind" ||
                     sItem == "ITEM_WiseWind")
            {
                //Uh... What the heck is this? Henchman stuff?
                object oMESSAGE1 = GetFirstPC();
                object oMESSAGE2 = GetNextPC();
                //Unlock the associated doors
                if (sItem == "ITEM_DarkWind")
                {
                    object oDoor = GetObjectByTag("Wizard_04_Undrentide");
                    SetLocked(oDoor, FALSE);
                }
                if (sItem == "ITEM_DeadWind")
                {
                    object oDoorA = GetObjectByTag("Crypt_04A_UndrentideA");
                    object oDoorB = GetObjectByTag("Crypt_04B_UndrentideB");
                    SetLocked(oDoorA, FALSE);
                    SetLocked(oDoorB, FALSE);
                }
                //Add it to the Ark of the Three Winds (unless it's already
                //there)
                object oArk = GetObjectByTag("ArkOfWinds");
                object oDuplicate = GetItemPossessedBy(oArk, sItem);
                if (oDuplicate == OBJECT_INVALID)
                {
                    CreateItemOnObject(sItem, oArk);
                }
                //Destroy original
                DestroyObject(oItem);
            }
        }

        //Update the loop variable
        oItem = GetNextItemInInventory(oPC);
    }
}

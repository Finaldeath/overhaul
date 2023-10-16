//::///////////////////////////////////////////////
//:: Library, Original Romance Temple (OnEnter)
//:: En_Library_03a.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Equip the Grand Matron with a weapon to
     correspond with the player's proficiencies
     and class.

     Based on the nw_o2_feat container script in
     the OC.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 28, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    object oMatron = GetObjectByTag("GrandMatron");
    int bDoOnce = GetLocalInt(OBJECT_SELF, "MatronEquip_DoOnce");
    string sWeapon;

    if (GetIsPC(oPC) == TRUE &&
        bDoOnce == FALSE)
    {
        // * Assign a weapon based on their weapon focus
        if (GetHasFeat(FEAT_WEAPON_FOCUS_BASTARD_SWORD, oPC) == TRUE)
        {
            sWeapon = "Matron_BstdSword";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_BATTLE_AXE,oPC) == TRUE)
        {
            sWeapon = "Matron_Battleaxe";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_CLUB,oPC) == TRUE)
        {
            sWeapon = "Matron_Club";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_DAGGER,oPC) == TRUE)
        {
            sWeapon = "Matron_Dagger";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_DART,oPC) == TRUE)
        {
            sWeapon = "Matron_Darts";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_DIRE_MACE,oPC) == TRUE)
        {
            sWeapon = "Matron_DblMace";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_DOUBLE_AXE,oPC) == TRUE)
        {
            sWeapon = "Matron_DblAxe";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_AXE,oPC) == TRUE)
        {
            sWeapon = "Matron_GrtAxe";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_SWORD,oPC) == TRUE)
        {
            sWeapon = "Matron_GrtSword";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_HALBERD,oPC) == TRUE)
        {
            sWeapon = "Matron_Halberd";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_HAND_AXE,oPC) == TRUE)
        {
            sWeapon = "Matron_Handaxe";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_HEAVY_CROSSBOW,oPC) == TRUE)
        {
            sWeapon = "Matron_HvyXbow";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_HEAVY_FLAIL,oPC) == TRUE)
        {
            sWeapon = "Matron_HvyFlail";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_KAMA,oPC) == TRUE)
        {
            sWeapon = "Matron_Kama";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_KATANA,oPC) == TRUE)
        {
            sWeapon = "Matron_Katana";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_KUKRI,oPC) == TRUE)
        {
            sWeapon = "Matron_Kukri";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_CROSSBOW,oPC) == TRUE)
        {
            sWeapon = "Matron_LtXbow";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_FLAIL,oPC) == TRUE)
        {
            sWeapon = "Matron_LtFlail";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_HAMMER,oPC) == TRUE)
        {
            sWeapon = "Matron_LtHammer";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_MACE,oPC) == TRUE)
        {
            sWeapon = "Matron_Mace";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_LONG_SWORD,oPC) == TRUE)
        {
            sWeapon = "Matron_Longsword";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_LONGBOW,oPC) == TRUE)
        {
            sWeapon = "Matron_Longbow";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_MORNING_STAR,oPC) == TRUE)
        {
            sWeapon = "Matron_MornStar";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_RAPIER,oPC) == TRUE)
        {
            sWeapon = "Matron_Rapier";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_SCIMITAR,oPC) == TRUE)
        {
            sWeapon = "Matron_Scimitar";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_SCYTHE,oPC) == TRUE)
        {
            sWeapon = "Matron_Scythe";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_SHORT_SWORD,oPC) == TRUE)
        {
            sWeapon = "Matron_ShrtSword";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_SHORTBOW,oPC) == TRUE)
        {
            sWeapon = "Matron_Shortbow";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_SHURIKEN,oPC) == TRUE)
        {
            sWeapon = "Matron_Shuriken";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_SICKLE,oPC) == TRUE)
        {
            sWeapon = "Matron_Sickle";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_SLING,oPC) == TRUE)
        {
            sWeapon = "Matron_Sling";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_SPEAR,oPC) == TRUE)
        {
            sWeapon = "Matron_Spear";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_STAFF,oPC) == TRUE)
        {
            sWeapon = "Matron_QtrStaff";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_THROWING_AXE,oPC) == TRUE)
        {
            sWeapon = "Matron_ThrowAxe";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_TWO_BLADED_SWORD,oPC) == TRUE)
        {
            sWeapon = "Matron_DblSword";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_UNARMED_STRIKE,oPC) == TRUE)
        {
            sWeapon = "Matron_Bracers";
        }
        else if (GetHasFeat(FEAT_WEAPON_FOCUS_WAR_HAMMER,oPC) == TRUE)
        {
            sWeapon = "Matron_Warhammer";
        }
        else
        {
            // * if get to this point then the PC did not have Weapon Focus
            // * in anything then assign a weapon based on class.
            if (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1)
            {
                sWeapon = "Matron_Spear";
            }
            else if (GetLevelByClass(CLASS_TYPE_WIZARD, oPC) >= 1)
            {
                sWeapon = "Matron_QtrStaff";
            }
            else if (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1)
            {
                sWeapon = "Matron_LtXbow";
            }
            else if (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 1)
            {
                sWeapon = "Matron_GrtSword";
            }
            else if (GetLevelByClass(CLASS_TYPE_FIGHTER, oPC) >= 1)
            {
                sWeapon = "Matron_Longsword";
            }
            else if (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 1)
            {
                sWeapon = "Matron_Longbow";
            }
            else if (GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC) >= 1)
            {
                sWeapon = "Matron_Club";
            }
            else if (GetLevelByClass(CLASS_TYPE_MONK, oPC) >= 1)
            {
                sWeapon = "Matron_Kama";
            }
            else if (GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1)
            {
                sWeapon = "Matron_Mace";
            }
            else if (GetLevelByClass(CLASS_TYPE_ROGUE, oPC) >= 1)
            {
                sWeapon = "Matron_Dagger";
            }
            else if (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 1)
            {
                sWeapon = "Matron_MornStar";
            }
        }

        //Give the matron the assigned weapon.
        object oWeapon;
        if (sWeapon == "Matron_Darts" ||
            sWeapon == "Matron_Shuriken" ||
            sWeapon == "Matron_ThrowAxe")
        {
            oWeapon = CreateItemOnObject(sWeapon, oMatron, 50);
        }
        else
        {
            oWeapon = CreateItemOnObject(sWeapon, oMatron);
        }

        //Make her equip it
        if (sWeapon == "Matron_Bracers")
        {
            AssignCommand(oMatron, ActionEquipItem(oWeapon, INVENTORY_SLOT_ARMS));
        }
        else
        {
            AssignCommand(oMatron, ActionEquipItem(oWeapon, INVENTORY_SLOT_RIGHTHAND));
        }

        //Flag the DoOnce
        SetLocalInt(OBJECT_SELF, "MatronEquip_DoOnce", TRUE);
    }
}

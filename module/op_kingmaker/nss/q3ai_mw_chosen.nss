//::///////////////////////////////////////////////
//:: Chosing the Weapon type
//:: q3ai_mw_chosen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    the magic weapon is created on the player
    after he/she chooses a type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oItem = GetItemPossessedBy(oPC,"os_magicweapon");

    if(GetIsObjectValid(oItem))
    {
        DestroyObject(oItem);
    }

    int nWeapon = GetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE");

    //11=Great Axe
    if(nWeapon==11)
    {
        oItem = CreateItemOnObject("os_mwgaxe", GetFirstPC(), 1);
    }
    //12=One Handed Axe
    if(nWeapon==12)
    {
        oItem = CreateItemOnObject("os_mwhaxe", GetFirstPC(), 1);
    }
    //13=Battle Axe
    if(nWeapon == 13)
    {
        oItem = CreateItemOnObject("os_mwbaxe", GetFirstPC(), 1);
    }
    //21=Bastard Sword
    if(nWeapon == 21)
    {
        oItem = CreateItemOnObject("os_mwbsword", GetFirstPC(), 1);
    }
    //22=Dagger
    if(nWeapon == 22)
    {
        oItem = CreateItemOnObject("os_mwdagger", GetFirstPC(), 1);
    }
    //23=Great Sword
    if(nWeapon == 23)
    {
        oItem = CreateItemOnObject("os_mwgsword", GetFirstPC(), 1);
    }
    //24=Long Sword
    if(nWeapon == 24)
    {
        oItem = CreateItemOnObject("os_mwlsword", GetFirstPC(), 1);
    }
    //25=Short Sword
    if(nWeapon == 25)
    {
        oItem = CreateItemOnObject("os_mwssword", GetFirstPC(), 1);
    }
    //31=Scimitar
    if(nWeapon == 31)
    {
        oItem = CreateItemOnObject("os_mwscim", GetFirstPC(), 1);
    }
    //32=Katana
    if(nWeapon == 32)
    {
        oItem = CreateItemOnObject("os_mwkatana", GetFirstPC(), 1);
    }
    //33=Rapier
    if(nWeapon == 33)
    {
        oItem = CreateItemOnObject("os_mwrapier", GetFirstPC(), 1);
    }
    //41=Club
    if(nWeapon == 41)
    {
        oItem = CreateItemOnObject("os_mwclub", GetFirstPC(), 1);
    }
    //42=Heavy Flail
    if(nWeapon == 42)
    {
        oItem = CreateItemOnObject("os_mwhflail", GetFirstPC(), 1);
    }
    //43=Light Flail
    if(nWeapon == 43)
    {
        oItem = CreateItemOnObject("os_mwlflail", GetFirstPC(), 1);
    }
    //44=Light Hammer
    if(nWeapon == 44)
    {
        oItem = CreateItemOnObject("os_mwlhammer", GetFirstPC(), 1);
    }
    //45=Warhammer
    if(nWeapon == 45)
    {
        oItem = CreateItemOnObject("os_mwwarham", GetFirstPC(), 1);
    }
    //46=Mace
    if(nWeapon == 46)
    {
        oItem = CreateItemOnObject("os_mwmace", GetFirstPC(), 1);
    }
    //47=Morningstar
    if(nWeapon == 47)
    {
        oItem = CreateItemOnObject("os_mwmstar", GetFirstPC(), 1);
    }
    //48=Quarterstaff
    if(nWeapon == 48)
    {
        oItem = CreateItemOnObject("os_mwqstaff", GetFirstPC(), 1);
    }
    //51=Dire Mace
    if(nWeapon == 51)
    {
        oItem = CreateItemOnObject("os_mwdmace", GetFirstPC(), 1);
    }
    //52=Double Axe
    if(nWeapon == 52)
    {
        oItem = CreateItemOnObject("os_mwdaxe", GetFirstPC(), 1);
    }
    //53=Two-Bladed Sword
    if(nWeapon == 53)
    {
        oItem = CreateItemOnObject("os_mw2bsword", GetFirstPC(), 1);
    }
    //61=Kama
    if(nWeapon == 61)
    {
        oItem = CreateItemOnObject("os_mwkama", GetFirstPC(), 1);
    }
    //62=Kukri
    if(nWeapon == 62)
    {
        oItem = CreateItemOnObject("os_mwkukri", GetFirstPC(), 1);
    }
    //63=Sickle
    if(nWeapon == 63)
    {
        oItem = CreateItemOnObject("os_mwsickle", GetFirstPC(), 1);
    }
    //71=Halberd
    if(nWeapon == 71)
    {
        oItem = CreateItemOnObject("os_mwhalberd", GetFirstPC(), 1);
    }
    //72=Scythe
    if(nWeapon == 72)
    {
        oItem = CreateItemOnObject("os_mwscythe", GetFirstPC(), 1);
    }
    //73=Spear
    if(nWeapon == 73)
    {
        oItem = CreateItemOnObject("os_mwspear", GetFirstPC(), 1);
    }
    //81=Heavy crossbow
    if(nWeapon == 81)
    {
        oItem = CreateItemOnObject("os_mwhxbow", GetFirstPC(), 1);
    }
    //82=Light crossbow
    if(nWeapon == 82)
    {
        oItem = CreateItemOnObject("os_mwlxbow", GetFirstPC(), 1);
    }
    //83=Longbow
    if(nWeapon == 83)
    {
        oItem = CreateItemOnObject("os_mwlbow", GetFirstPC(), 1);
    }
    //84=Shortbow
    if(nWeapon == 84)
    {
        oItem = CreateItemOnObject("os_mwsbow", GetFirstPC(), 1);
    }
    //85=Sling
    if(nWeapon == 85)
    {
        oItem = CreateItemOnObject("os_mwsling", GetFirstPC(), 1);
    }

    DelayCommand(0.5f, AssignCommand(GetFirstPC(),
        ActionEquipItem(oItem, INVENTORY_SLOT_RIGHTHAND)));
}

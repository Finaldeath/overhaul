#include "help_hench"

int IsWeapon(object o)
{
    int result = GetBaseItemType(o);

    switch (result)
    {
        case BASE_ITEM_ARROW:
            return TRUE;
            break;

        case BASE_ITEM_BASTARDSWORD:
            return TRUE;
            break;

        case BASE_ITEM_BATTLEAXE:
            return TRUE;
            break;

        case BASE_ITEM_BOLT:
            return TRUE;
            break;

        case BASE_ITEM_CLUB:
            return TRUE;
            break;

        case BASE_ITEM_DAGGER:
            return TRUE;
            break;

        case BASE_ITEM_DART:
            return TRUE;
            break;

        case BASE_ITEM_DIREMACE:
            return TRUE;
            break;

        case BASE_ITEM_DOUBLEAXE:
            return TRUE;
            break;

        case BASE_ITEM_GREATAXE:
            return TRUE;
            break;

        case BASE_ITEM_GREATSWORD:
            return TRUE;
            break;

        case BASE_ITEM_HALBERD:
            return TRUE;
            break;

        case BASE_ITEM_HANDAXE:
            return TRUE;
            break;

        case BASE_ITEM_HEAVYCROSSBOW:
            return TRUE;
            break;

        case BASE_ITEM_HEAVYFLAIL:
            return TRUE;
            break;

        case BASE_ITEM_KAMA:
            return TRUE;
            break;

        case BASE_ITEM_KATANA:
            return TRUE;
            break;

        case BASE_ITEM_KUKRI:
            return TRUE;
            break;

        case BASE_ITEM_LIGHTCROSSBOW:
            return TRUE;
            break;

        case BASE_ITEM_LIGHTFLAIL:
            return TRUE;
            break;

        case BASE_ITEM_LIGHTHAMMER:
            return TRUE;
            break;

        case BASE_ITEM_LIGHTMACE:
            return TRUE;
            break;

        case BASE_ITEM_LONGBOW:
            return TRUE;
            break;

        case BASE_ITEM_LONGSWORD:
            return TRUE;
            break;

        case BASE_ITEM_MAGICROD:
            return TRUE;
            break;

        case BASE_ITEM_MAGICSTAFF:
            return TRUE;
            break;

        case BASE_ITEM_MAGICWAND:
            return TRUE;
            break;

        case BASE_ITEM_MORNINGSTAR:
            return TRUE;
            break;

        case BASE_ITEM_QUARTERSTAFF:
            return TRUE;
            break;

        case BASE_ITEM_RAPIER:
            return TRUE;
            break;

        case BASE_ITEM_SCIMITAR:
            return TRUE;
            break;

        case BASE_ITEM_SCYTHE:
            return TRUE;
            break;

        case BASE_ITEM_SHORTBOW:
            return TRUE;
            break;

        case BASE_ITEM_SHORTSPEAR:
            return TRUE;
            break;

        case BASE_ITEM_SHORTSWORD:
            return TRUE;
            break;

        case BASE_ITEM_SHURIKEN:
            return TRUE;
            break;

        case BASE_ITEM_SICKLE:
            return TRUE;
            break;

        case BASE_ITEM_SLING:
            return TRUE;
            break;

        case BASE_ITEM_THROWINGAXE:
            return TRUE;
            break;

        case BASE_ITEM_TWOBLADEDSWORD:
            return TRUE;
            break;

        case BASE_ITEM_WARHAMMER:
            return TRUE;
            break;

        default:
            return FALSE;
            break;
    }

    return FALSE;
}

void TakeItem(object o, object oPC)
{
    string s = GetTag(o);
    int nStackSize = GetNumStackedItems(o);

    s = GetStringLowerCase(s);

    // find empty slot in Module's Inventory List of taken items
    int nInvSlot = GetLocalInt(GetModule(), "nInvSlot");

    // set the res ref of the item in the proper place
    SetLocalString(GetModule(), "sInvSlot" + IntToString(nInvSlot), s);

    // set the item's stack size in the proper place
    SetLocalInt(GetModule(), "sInvSlot" + IntToString(nInvSlot) + "Stack", nStackSize);

    // increment and reset the next empty inventory slot
    nInvSlot++;
    SetLocalInt(GetModule(), "nInvSlot", nInvSlot);

    DestroyObject(o);
}

// helper function for unequiping items in conversation
void CustomUnequipItem(object o, int invSlot)
{
    object oItem = GetItemInSlot(invSlot);

    SetLocalObject(o, "BT_OITEM_CHECKER", oItem);

    AssignCommand(o, ActionUnequipItem(oItem));
}

// check to see if a weapon is right hand compatible
int IsRHItem(object oItem)
{
    switch (GetBaseItemType(oItem))
    {
        case BASE_ITEM_BASTARDSWORD: return TRUE;
            break;

        case BASE_ITEM_BATTLEAXE: return TRUE;
            break;

        case BASE_ITEM_CLUB: return TRUE;
            break;

        case BASE_ITEM_DAGGER: return TRUE;
            break;

        case BASE_ITEM_DART: return TRUE;
            break;

        case BASE_ITEM_DIREMACE: return TRUE;
            break;

        case BASE_ITEM_DOUBLEAXE: return TRUE;
            break;

        case BASE_ITEM_GREATAXE: return TRUE;
            break;

        case BASE_ITEM_GREATSWORD: return TRUE;
            break;

        case BASE_ITEM_HALBERD: return TRUE;
            break;

        case BASE_ITEM_HANDAXE: return TRUE;
            break;

        case BASE_ITEM_HEAVYCROSSBOW: return TRUE;
            break;

        case BASE_ITEM_HEAVYFLAIL: return TRUE;
            break;

        case BASE_ITEM_KAMA: return TRUE;
            break;

        case BASE_ITEM_KATANA: return TRUE;
            break;

        case BASE_ITEM_KUKRI: return TRUE;
            break;

        case BASE_ITEM_LIGHTCROSSBOW: return TRUE;
            break;

        case BASE_ITEM_LIGHTFLAIL: return TRUE;
            break;

        case BASE_ITEM_LIGHTHAMMER: return TRUE;
            break;

        case BASE_ITEM_LIGHTMACE: return TRUE;
            break;

        case BASE_ITEM_LONGBOW: return TRUE;
            break;

        case BASE_ITEM_LONGSWORD: return TRUE;
            break;

        case BASE_ITEM_MAGICROD: return TRUE;
            break;

        case BASE_ITEM_MAGICSTAFF: return TRUE;
            break;

        case BASE_ITEM_MAGICWAND: return TRUE;
            break;

        case BASE_ITEM_MORNINGSTAR: return TRUE;
            break;

        case BASE_ITEM_QUARTERSTAFF: return TRUE;
            break;

        case BASE_ITEM_RAPIER: return TRUE;
            break;

        case BASE_ITEM_SCIMITAR: return TRUE;
            break;

        case BASE_ITEM_SCYTHE: return TRUE;
            break;

        case BASE_ITEM_SHORTBOW: return TRUE;
            break;

        case BASE_ITEM_SHORTSPEAR: return TRUE;
            break;

        case BASE_ITEM_SHORTSWORD: return TRUE;
            break;

        case BASE_ITEM_SHURIKEN: return TRUE;
            break;

        case BASE_ITEM_SICKLE: return TRUE;
            break;

        case BASE_ITEM_SLING: return TRUE;
            break;

        case BASE_ITEM_THROWINGAXE: return TRUE;
            break;

        case BASE_ITEM_TORCH: return TRUE;
            break;

        case BASE_ITEM_TWOBLADEDSWORD: return TRUE;
            break;

        case BASE_ITEM_WARHAMMER: return TRUE;
            break;

        default: return FALSE;
            break;
    }

    return FALSE;
}

// check to see if a weapon is left hand compatible
int IsLHItem(object oItem)
{
    switch (GetBaseItemType(oItem))
    {
        case BASE_ITEM_BATTLEAXE: return TRUE;
            break;

        case BASE_ITEM_CLUB: return TRUE;
            break;

        case BASE_ITEM_DAGGER: return TRUE;
            break;

        case BASE_ITEM_HANDAXE: return TRUE;
            break;

        case BASE_ITEM_KAMA: return TRUE;
            break;

        case BASE_ITEM_KATANA: return TRUE;
            break;

        case BASE_ITEM_KUKRI: return TRUE;
            break;

        case BASE_ITEM_LIGHTFLAIL: return TRUE;
            break;

        case BASE_ITEM_LIGHTHAMMER: return TRUE;
            break;

        case BASE_ITEM_LIGHTMACE: return TRUE;
            break;

        case BASE_ITEM_LONGSWORD: return TRUE;
            break;

        case BASE_ITEM_MORNINGSTAR: return TRUE;
            break;

        case BASE_ITEM_RAPIER: return TRUE;
            break;

        case BASE_ITEM_SCIMITAR: return TRUE;
            break;

        case BASE_ITEM_SHORTSWORD: return TRUE;
            break;

        case BASE_ITEM_SICKLE: return TRUE;
            break;

        case BASE_ITEM_TORCH: return TRUE;
            break;

        case BASE_ITEM_WARHAMMER: return TRUE;
            break;

        case BASE_ITEM_LARGESHIELD: return TRUE;
            break;

        case BASE_ITEM_SMALLSHIELD: return TRUE;
            break;

        case BASE_ITEM_TOWERSHIELD: return TRUE;
            break;

        default: return FALSE;
            break;
    }

    return FALSE;
}

int IsArmor(object oItem)
{
    if (GetBaseItemType(oItem) == BASE_ITEM_ARMOR)
        return TRUE;

    return FALSE;
}

int IsBelt(object oItem)
{
    if (GetBaseItemType(oItem) == BASE_ITEM_BELT)
        return TRUE;

    return FALSE;
}

int IsCloak(object oItem)
{
    if (GetBaseItemType(oItem) == BASE_ITEM_CLOAK)
        return TRUE;

    return FALSE;
}

int IsHelmet(object oItem)
{
    if (GetBaseItemType(oItem) == BASE_ITEM_HELMET)
        return TRUE;

    return FALSE;
}

int IsRing(object oItem)
{
    if (GetBaseItemType(oItem) == BASE_ITEM_RING)
        return TRUE;

    return FALSE;
}

int IsBoots(object oItem)
{
    if (GetBaseItemType(oItem) == BASE_ITEM_BOOTS)
        return TRUE;

    return FALSE;
}

int IsAmulet(object oItem)
{
    if (GetBaseItemType(oItem) == BASE_ITEM_AMULET)
        return TRUE;

    return FALSE;
}

int IsBracer(object oItem)
{
    if (GetBaseItemType(oItem) == BASE_ITEM_BRACER)
        return TRUE;

    return FALSE;
}

int IsArrow(object oItem)
{
    if (GetBaseItemType(oItem) == BASE_ITEM_ARROW)
        return TRUE;

    return FALSE;
}

int IsBolt(object oItem)
{
    if (GetBaseItemType(oItem) == BASE_ITEM_BOLT)
        return TRUE;

    return FALSE;
}

int IsBullet(object oItem)
{
    if (GetBaseItemType(oItem) == BASE_ITEM_BULLET)
        return TRUE;

    return FALSE;
}

void InventoryOption(object oCreature = OBJECT_SELF, int j = 0)
{
    int n = GetLocalInt(oCreature, "BT_H_INV_MANAGER");

    int i = (n * 15) + j;

    object o = GetLocalObject(oCreature, "BT_EQ_ITEM_" + IntToString(i));

    int nOption = GetLocalInt(oCreature, "BT_H_INV_CURR_CHOICE");

    // used during equipping of items
    if (nOption == 1)
    {
        int iSlot = GetLocalInt(oCreature, "BT_H_INV_SLOT");

        AssignCommand(oCreature, ActionEquipItem(o, iSlot));

        if (GetItemInSlot(iSlot) == o)
        {
            SetLocalInt(oCreature, "BT_H_INV_CHECKER", TRUE);
            SetLocalObject(GetRefHench(oCreature), "O_EQUIPPED_ITEM" + IntToString(iSlot), GetLocalObject(o, "N_REF_ITEM"));
        }

        else
            SetLocalInt(oCreature, "BT_H_INV_CHECKER", FALSE);
    }

    // used when PC chooses to take an item
    else if (nOption == 2)
    {
        AssignCommand(oCreature, ActionGiveItem(o, GetMaster(oCreature)));
    }

    // used when PC chooses to give an item
    else if (nOption == 3)
    {
        AssignCommand(oCreature, ActionGiveItem(o, GetHenchman(oCreature)));
    }
}

int EqItemHelper(object oCreature)
{
    int n = GetLocalInt(oCreature, "BT_H_INV_MANAGER");

    int nCursor = GetLocalInt(oCreature, "BT_H_INV_EQ_CURSOR");

    int i = (n * 15) + nCursor;

    object o = GetLocalObject(oCreature, "BT_EQ_ITEM_" + IntToString(i));

    if (o != OBJECT_INVALID)
    {
        SetCustomToken(11000 + nCursor, GetName(o));
        SetCustomToken(11015 + nCursor, " ; Stack Size : " + IntToString(GetNumStackedItems(o)));
        nCursor++;

        SetLocalInt(oCreature, "BT_H_INV_EQ_CURSOR", nCursor);

        return TRUE;
    }

    return FALSE;
}

void ResetInvCheckVariables(object oCreature, int n)
{
    DeleteLocalInt(oCreature, "BT_H_INV_MANAGER");

    SetLocalInt(oCreature, "BT_H_INV_EQ_CURSOR", 1);

    SetLocalInt(oCreature, "BT_H_INV_CURR_CHOICE", n);

    SetLocalObject(OBJECT_SELF, "BT_H_INV_MOD_OBJECT", oCreature);

    int i = 1;

    object o = GetFirstItemInInventory(oCreature);

    while (o != OBJECT_INVALID)
    {
        SetLocalObject(oCreature, "BT_EQ_ITEM_" + IntToString(i), o);

        i++;

        o = GetNextItemInInventory(oCreature);
    }

    // to mark end of list
    DeleteLocalObject(oCreature, "BT_EQ_ITEM_" + IntToString(i));
}

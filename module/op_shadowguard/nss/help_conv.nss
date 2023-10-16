// ------------- BEGIN SPECIFICATIONS ------------ //

// HasItem - returns TRUE is o possesses an item with sTag,
//    FALSE otherwise
int HasItem(object o, string sTag);

// GeneratePCTag - generates a special PC "tag"; used when
//    multiple PC's are in the game for conversations
string GeneratePCTag(object oPC);

// GetPCTalkLevelInt - returns int value for current
//    "talk level" PC is at with creatures with sTag for
//    their tag
int GetPCTalkLevelInt(object oPC, string sTag);

// SetPCTalkLevelInt - sets the int value for current
//    "talk level" PC is at with creatures with sTag for
//    their tag
void SetPCTalkLevelInt(object oPC, string sTag, int nValue);

// AdjustAlignmentNeutral - only adjusts if PC is currently of Good alignment
void AdjustAlignmentNeutral(object oPC, int nAmount);

// AdjustAlignmentNeutralLC - only adjusts if PC is currently of Lawful alignment
void AdjustAlignmentNeutralLC(object oPC, int nAmount);

// ------------- END SPECIFICATIONS -------------- //

// ----------------------------------------------- //

// ------------- BEGIN IMPLEMENTATIONS ----------- //

int HasItem(object o, string sTag)
{
    if (GetItemPossessedBy(o, sTag) != OBJECT_INVALID)
        return TRUE;

    return FALSE;
}

string GeneratePCTag(object oPC)
{
    return (GetPCPublicCDKey(oPC) + GetPCPlayerName(oPC));
}



int GetPCTalkLevelInt(object oPC, string sTag)
{
    string s = GeneratePCTag(oPC);

    return GetLocalInt(GetModule(), s + "N_TALK_LVL_" + sTag);
}

void SetPCTalkLevelInt(object oPC, string sTag, int nValue)
{
    string s = GeneratePCTag(oPC);

    SetLocalInt(GetModule(), s + "N_TALK_LVL_" + sTag, nValue);
}

int GetSelfTalkLevelInt(object o)
{
    return GetLocalInt(GetModule(), "N_TALK_LVL_" + GetTag(o));
}

void SetSelfTalkLevelInt(object o, int nValue)
{
    SetLocalInt(GetModule(), "N_TALK_LVL_" + GetTag(o), nValue);
}

void SetPCInt(object oPC, string sVariable, int nValue)
{
    SetLocalInt(GetModule(), GeneratePCTag(oPC) + sVariable, nValue);
}

int GetPCInt(object oPC, string sVariable)
{
    return GetLocalInt(GetModule(), GeneratePCTag(oPC) + sVariable);
}

void SetNPCInt(object o, string sVariable, int nValue)
{
    SetLocalInt(GetModule(), GetTag(o) + sVariable, nValue);
}

int GetNPCInt(object o, string sVariable)
{
    return GetLocalInt(GetModule(), GetTag(o) + sVariable);
}

void SetPCString(object oPC, string sVariable, string sValue)
{
    SetLocalString(GetModule(), GeneratePCTag(oPC) + sVariable, sValue);
}

string GetPCString(object oPC, string sVariable)
{
    return GetLocalString(GetModule(), GeneratePCTag(oPC) + sVariable);
}

int GetPCCharChoice(object oPC)
{
    return GetPCInt(oPC, "S_PLAYER_CHOICE");
}

int GetPCClassType(object oPC)
{
    int classType = GetClassByPosition(1, oPC);

    switch (classType)
    {
        case CLASS_TYPE_FIGHTER:
            return CLASS_TYPE_FIGHTER;
            break;

        case CLASS_TYPE_BARBARIAN:
            return CLASS_TYPE_FIGHTER;
            break;

        case CLASS_TYPE_RANGER:
            return CLASS_TYPE_FIGHTER;
            break;

        case CLASS_TYPE_WIZARD:
            return CLASS_TYPE_WIZARD;
            break;

        case CLASS_TYPE_SORCERER:
            return CLASS_TYPE_WIZARD;
            break;

        case CLASS_TYPE_ROGUE:
            return CLASS_TYPE_ROGUE;
            break;

        case CLASS_TYPE_BARD:
            return CLASS_TYPE_ROGUE;
            break;

        case CLASS_TYPE_CLERIC:
            return CLASS_TYPE_CLERIC;
            break;

        case CLASS_TYPE_PALADIN:
            return CLASS_TYPE_CLERIC;
            break;

        case CLASS_TYPE_MONK:
            return CLASS_TYPE_CLERIC;
            break;

        case CLASS_TYPE_DRUID:
            return CLASS_TYPE_CLERIC;
            break;

        default:
            return CLASS_TYPE_INVALID;
            break;
    }

    return CLASS_TYPE_INVALID;
}

int GetFactionValue(object o, int nFaction)
{
    string s;

    switch (nFaction)
    {
        case 1:
            s = "FACTION_EVERGREEN";
            break;

        case 2:
            s = "FACTION_SHARAKIN";
            break;

        case 3:
            s = "FACTION_AVORIEL";
            break;

        default:
            s = "";
            break;
    }

    return GetPCInt(o, s);
}

void ModFactionValue(object o, int nFaction, int nAmount)
{
    string s;

    switch (nFaction)
    {
        case 1:
            s = "FACTION_EVERGREEN";
            break;

        case 2:
            s = "FACTION_SHARAKIN";
            break;

        case 3:
            s = "FACTION_AVORIEL";
            break;

        default:
            s = "";
            break;
    }

    int n = GetFactionValue(o, nFaction);

    n += nAmount;

    if (n > 100)
        n = 100;

    else if (n < 11)
        n = 11;

    SetPCInt(o, s, n);
}

void AdjustAlignmentNeutral(object oPC, int nAmount)
{
    if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_GOOD)
    {
        AdjustAlignment(oPC, ALIGNMENT_EVIL, nAmount);
        SendMessageToPC(oPC, "[Your actions have led you towards the path of Neutrality.]");
    }
}

void AdjustAlignmentNeutralLC(object oPC, int nAmount)
{
    if (GetAlignmentLawChaos(oPC) == ALIGNMENT_LAWFUL)
    {
        AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, nAmount);
        SendMessageToPC(oPC, "[Your actions have led you towards the path of Neutrality.]");
    }
}

// Armand's AI

#include "nw_i0_generic"
#include "x2_inc_itemprop"

object oWPRun1 = GetWaypointByTag("q3b_wp_armand_move1");
object oWPRun2 = GetWaypointByTag("q3b_wp_armand_move2");
object oWPRun3 = GetWaypointByTag("q3b_wp_armand_move3");
object oWPRun4 = GetWaypointByTag("q3b_wp_armand_move4");
object oWPCast0 = GetWaypointByTag("q3b_spell_target0");
object oWPCast1 = GetWaypointByTag("q3b_spell_target1");
object oWPCast2 = GetWaypointByTag("q3b_spell_target2");
object oWPCast3 = GetWaypointByTag("q3b_spell_target3");

int GetIsToughArmand()
{
    return GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES ||
           GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT;
}


// Teleports to oWP and would run to next wp only if close and teleport otherwise
void Teleport(object oWP)
{
     effect eVis = EffectVisualEffect(471);
     ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
     JumpToObject(oWP);
     SetLocalInt(OBJECT_SELF, "CAN_TELEPORT", 0);
     SetLocalInt(OBJECT_SELF, "TELEPORTED", 1); // teleported once -> all movements are teleports now
     ActionDoCommand(DetermineCombatRound());
}

// Move to the next wp (teleport if too far).
object GetNextWP()
{
    object oCurrentWP = GetLocalObject(OBJECT_SELF, "CURRENT_WP");

    if(oCurrentWP == OBJECT_INVALID)
    {
        oCurrentWP = oWPRun1;
    }
    else if(oCurrentWP == oWPRun1)
    {
        oCurrentWP = oWPRun2;
    }
    else if(oCurrentWP == oWPRun2)
    {
        oCurrentWP = oWPRun3;
    }
    else if(oCurrentWP == oWPRun3)
    {
        oCurrentWP = oWPRun4;
    }
    else
        return OBJECT_INVALID;

    SetLocalObject(OBJECT_SELF, "CURRENT_WP", oCurrentWP);
    //float fDistance = GetDistanceBetween(OBJECT_SELF, oCurrentWP);
    if(GetLocalInt(OBJECT_SELF, "TELEPORTED") == 1)
        Teleport(oCurrentWP);
    ActionMoveToObject(oCurrentWP, TRUE, 0.0);

    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
    ActionDoCommand(SetFacingPoint(GetPosition(oEnemy)));
    return oCurrentWP;
}

void SummonElementals(object oIntruder)
{
    int i = 1;
    object oWP = GetNearestObjectByTag("q3d_wp_elemental", OBJECT_SELF, i);
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    object oElemental;
    while(oWP != OBJECT_INVALID)
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
        oElemental = CreateObject(OBJECT_TYPE_CREATURE, "q3_fire_elem", GetLocation(oWP));
        AssignCommand(oElemental, ActionAttack(oIntruder));
        i++;
        oWP = GetNearestObjectByTag("q3d_wp_elemental", OBJECT_SELF, i);
    }
}

// returns 1 if there is a magic threat, 2 if there is a fighting threat and 0 otherwise
int GetThreat()
{
    int i = 1;
    float fDistance;
    object oItem;
    int nWizardLevel;
    int nSorcererLevel;
    int nDruidLevel;
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF ,i);
    while(oEnemy != OBJECT_INVALID)
    {
        //SendMessageToPC(GetFirstPC(), "BOOM GetThreat, enemy= " + GetName(oEnemy));
        if(GetObjectSeen(oEnemy))
        {
            nWizardLevel = GetLevelByClass(CLASS_TYPE_WIZARD, oEnemy);
            nSorcererLevel = GetLevelByClass(CLASS_TYPE_SORCERER, oEnemy);
            if(nWizardLevel > 10 || nSorcererLevel > 10) // magic threat
                return 1;
            return 2;
        }
        i++;
        oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF ,i);
    }
    return 0;
}

// returns TRUE if Armand has 50%-75% hit points
int IsLightlyWounded()
{
    float fMax = IntToFloat(GetMaxHitPoints());
    float fCurrent = IntToFloat(GetCurrentHitPoints());
    float fDiv = fCurrent / fMax;

    return fDiv <= 0.75;
}

// returns TRUE if Armand has less than 50% hit points
int IsSeriouslyWounded()
{
    float fMax = IntToFloat(GetMaxHitPoints());
    float fCurrent = IntToFloat(GetCurrentHitPoints());
    float fDiv = fCurrent / fMax;

    return fDiv < 0.5;
}

// returns TRUE if there is a close enemy
int HasCloseEnemy()
{
    int i = 1;
    float fDistance;
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF ,i);
    while(oEnemy != OBJECT_INVALID)
    {
        if(GetObjectSeen(oEnemy))
        {
            fDistance = GetDistanceBetween(OBJECT_SELF, oEnemy);
            if(fDistance <= 10.0) // too close with melee weapon- no time for buffs
               return TRUE;
        }
        i++;
        oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF ,i);
    }
    return FALSE;
}

// returns TRUE if there is a nearby enemy with a melee weapon or a far enemy with a ranged weapon
// who also have less than 10 levels as arcane spell caster
int HasFightingEnemy()
{
    int i = 1;
    float fDistance;
    object oItem;
    int nWizardLevel;
    int nSorcererLevel;
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF ,i);
    while(oEnemy != OBJECT_INVALID)
    {
        if(GetObjectSeen(oEnemy))
        {
            nWizardLevel = GetLevelByClass(CLASS_TYPE_WIZARD, oEnemy);
            nSorcererLevel = GetLevelByClass(CLASS_TYPE_SORCERER, oEnemy);
            // if the enemy is a wizard, then I don't care if he is threatening with  a weapon
            if(nWizardLevel < 10 && nSorcererLevel < 10)
            {
                fDistance = GetDistanceBetween(OBJECT_SELF, oEnemy);
                oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oEnemy);
                if(fDistance <= 15.0 && IPGetIsMeleeWeapon(oItem)) // too close with melee weapon- no time for buffs
                   return TRUE;
                else if(IPGetIsRangedWeapon(oItem)) // equiped with ranged weapon
                   return TRUE;
            }
        }
        i++;
        oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF ,i);
    }
    return FALSE;
}

void MyCastSpell(int nSpell, object oTarget, int nMetaMagic=METAMAGIC_ANY, int bCheat=FALSE, int nDomainLevel=0, int nProjectilePathType=PROJECTILE_PATH_TYPE_DEFAULT, int bInstantSpell=FALSE)
{
    string sName = GetStringByStrRef(StringToInt(Get2DAString("spells", "Name", nSpell)));
    //SendMessageToPC(GetFirstPC(), "BOOM Casting spell: " + sName + " on: " + GetName(oTarget));
    ActionCastSpellAtObject(nSpell, oTarget, nMetaMagic, bCheat, nDomainLevel, nProjectilePathType, bInstantSpell);
}

void MyCastSpellAtLocation(int nSpell, location lTarget, int nMetaMagic=METAMAGIC_ANY, int bCheat=FALSE, int nDomainLevel=0, int nProjectilePathType=PROJECTILE_PATH_TYPE_DEFAULT, int bInstantSpell=FALSE)
{
    string sName = GetStringByStrRef(StringToInt(Get2DAString("spells", "Name", nSpell)));
    //SendMessageToPC(GetFirstPC(), "BOOM Casting spell: " + sName);
    ActionCastSpellAtLocation(nSpell, lTarget, nMetaMagic, bCheat, nProjectilePathType, bInstantSpell);
}

const int BUFF_PRIORITY_HIGH = 0;
const int BUFF_PRIORITY_MED = 1;
const int BUFF_PRIORITY_LOW = 2;
// Returning 1 is did a buff, 0 otherwise
int Buff(object oIntruder, int bPriority)
{
    // HIGH: must do these buffs no matter what
    if(bPriority == BUFF_PRIORITY_HIGH)
    {
        //SendMessageToPC(GetFirstPC(), "BUFFING HIGH against intruder=" + GetName(oIntruder));

        if(GetThreat() == 1) // magic threat
        {
            if(GetHasSpell(SPELL_GREATER_SPELL_MANTLE))
            {
                MyCastSpell(SPELL_GREATER_SPELL_MANTLE, OBJECT_SELF);
                return 1;
            }
            if(!GetHasSpellEffect(SPELL_GREATER_SPELL_MANTLE) && GetHasSpell(SPELL_SPELL_MANTLE))
            {
                MyCastSpell(SPELL_SPELL_MANTLE, OBJECT_SELF);
                return 1;
            }
        }
        else if(GetThreat() == 2) // fighting threat
        {
            if(GetHasSpell(SPELL_PREMONITION))
            {
                MyCastSpell(SPELL_PREMONITION, OBJECT_SELF);
                return 1;
            }
        }
        // no threat
        return 0;
    }
    // MED: would buff only when an enemy is not threatening and before doing anything else
    else if(bPriority == BUFF_PRIORITY_MED)
    {
        //SendMessageToPC(GetFirstPC(), "BUFFING MED against intruder=" + GetName(oIntruder));

        // checking if condition allows casting of buffs
        if (HasFightingEnemy())
            return 0;
        if(GetHasSpell(SPELL_PREMONITION))
        {
            MyCastSpell(SPELL_PREMONITION, OBJECT_SELF);
            return 1;
        }
        /*if(GetHasSpell(SPELL_HASTE) && ! GetHasSpellEffect(SPELL_HASTE))
        {
            MyCastSpell(SPELL_HASTE, OBJECT_SELF);
            return 1;
        }*/
        if(GetHasSpell(SPELL_GREATER_SPELL_MANTLE))
        {
            MyCastSpell(SPELL_GREATER_SPELL_MANTLE, OBJECT_SELF);
            return 1;
        }
        if(GetHasSpell(SPELL_TRUE_SEEING))
        {
            MyCastSpell(SPELL_TRUE_SEEING, OBJECT_SELF);
            return 1;
        }
        if(GetHasSpell(SPELL_ELEMENTAL_SHIELD))
        {
            MyCastSpell(SPELL_ELEMENTAL_SHIELD, OBJECT_SELF);
            return 1;
        }
        if(GetHasSpell(SPELL_ENERGY_BUFFER))
        {
            MyCastSpell(SPELL_ENERGY_BUFFER, OBJECT_SELF);
            return 1;
        }
        if(GetHasSpell(SPELL_DEATH_ARMOR))
        {
            MyCastSpell(SPELL_DEATH_ARMOR, OBJECT_SELF);
            return 1;
        }
        if(GetHasSpell(SPELL_RESIST_ELEMENTS))
        {
            MyCastSpell(SPELL_RESIST_ELEMENTS, OBJECT_SELF);
            return 1;
        }
        if(GetHasSpell(SPELL_FOXS_CUNNING))
        {
            MyCastSpell(SPELL_FOXS_CUNNING, OBJECT_SELF);
            return 1;
        }
        // Jump to player if he's hiding
        if(oIntruder == OBJECT_INVALID && GetLocalInt(OBJECT_SELF, "CAN_TELEPORT") == 1)
        {
            object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
            object oTeleport = GetNearestObjectByTag("q3c_wp_teleport", oEnemy);
            Teleport(oTeleport);
            return 1;
        }
        return 0;

    }
    // LOW: would buff only if there is nothing else to do
    else if(bPriority == BUFF_PRIORITY_LOW)
    {
        //SendMessageToPC(GetFirstPC(), "BUFFING LOW against intruder=" + GetName(oIntruder));

        if(GetHasSpell(SPELL_RESIST_ELEMENTS))
        {
            MyCastSpell(SPELL_RESIST_ELEMENTS, OBJECT_SELF);
            return 1;
        }
        if(GetHasSpell(SPELL_TRUE_SEEING))
        {
            MyCastSpell(SPELL_TRUE_SEEING, OBJECT_SELF);
            return 1;
        }
        // Jump to player if he's hiding
        if(oIntruder == OBJECT_INVALID && GetLocalInt(OBJECT_SELF, "CAN_TELEPORT") == 1)
        {
            object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
            object oTeleport = GetNearestObjectByTag("q3c_wp_teleport", oEnemy);
            Teleport(oTeleport);
            return 1;
        }
        if(GetHasSpell(SPELL_ELEMENTAL_SHIELD))
        {
            MyCastSpell(SPELL_ELEMENTAL_SHIELD, OBJECT_SELF);
            return 1;
        }
        if(GetHasSpell(SPELL_ENERGY_BUFFER))
        {
            MyCastSpell(SPELL_ENERGY_BUFFER, OBJECT_SELF);
            return 1;
        }
        if(GetHasSpell(SPELL_DEATH_ARMOR))
        {
            MyCastSpell(SPELL_DEATH_ARMOR, OBJECT_SELF);
            return 1;
        }
        if(GetHasSpell(SPELL_RESIST_ELEMENTS))
        {
            MyCastSpell(SPELL_RESIST_ELEMENTS, OBJECT_SELF);
            return 1;
        }
        if(GetHasSpell(SPELL_FOXS_CUNNING))
        {
            MyCastSpell(SPELL_FOXS_CUNNING, OBJECT_SELF);
            return 1;
        }

    }
    return 0;
}

int SpecialAction(object oIntruder)
{
    int nStatus = GetLocalInt(OBJECT_SELF, "SPECIAL_ACTION_STATUS");
    //SendMessageToPC(GetFirstPC(), "BOOM: special action status= " + IntToString(nStatus));
    if(nStatus == 0) // first action in combat
    {
        SetLocalInt(OBJECT_SELF, "SPECIAL_ACTION_STATUS", 1);
        //MyCastSpell(SPELL_TIME_STOP, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        MyCastSpell(SPELL_TIME_STOP, OBJECT_SELF);
        DelayCommand(2.0, SummonElementals(oIntruder));
        MyCastSpellAtLocation(SPELL_INCENDIARY_CLOUD, GetLocation(oWPCast0));
        MyCastSpell(SPELL_BIGBYS_CLENCHED_FIST, oIntruder);
        //MyCastSpellAtLocation(SPELL_ACID_FOG, GetLocation(oWPCast1));
        //if(GetIsToughArmand())
        //    MyCastSpellAtLocation(SPELL_DELAYED_BLAST_FIREBALL, GetLocation(oWPCast3));
        object oWP = GetNextWP();
        MyCastSpellAtLocation(SPELL_ACID_FOG, GetLocation(oWPCast1), METAMAGIC_ANY, FALSE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        oWP = GetNextWP();
        MyCastSpellAtLocation(SPELL_ACID_FOG, GetLocation(oWPCast2));
        MyCastSpellAtLocation(SPELL_EVARDS_BLACK_TENTACLES, GetLocation(oWPCast2));
        ActionDoCommand(SetLocalInt(OBJECT_SELF, "SPECIAL_ACTION_STATUS", 2));
        return 1;
    }
    else if(nStatus == 1) // did not finish the above queue - try again
    {
        ActionDoCommand(SetLocalInt(OBJECT_SELF, "SPECIAL_ACTION_STATUS", 2));
        return 1;
    }
    else if(nStatus == 2) // after running outside of room
    {
        SetLocalInt(OBJECT_SELF, "SPECIAL_ACTION_STATUS", 8);
        ActionDoCommand(DetermineCombatRound(oIntruder));
        return 1;
    }
    else if(nStatus == 8)
    {
        SetLocalInt(OBJECT_SELF, "CAN_TELEPORT", 1);
        // NOTE: staying in this status
        if(IsSeriouslyWounded())
        {
            if(GetNextWP() != OBJECT_INVALID)
                return 1;
        }
        ActionDoCommand(DetermineCombatRound(oIntruder));
    }
    return 0;
}

int Attack(object oIntruder)
{
    if(oIntruder == OBJECT_INVALID)
        return 0;
    object oStaff = GetItemPossessedBy(OBJECT_SELF, "q3_armand_staff");
    int nCharges = GetItemCharges(oStaff);

    //SendMessageToPC(GetFirstPC(), "BOOM: Trying to Attack: " + GetName(oIntruder));
    // check if need to cast emergency attack spells (someone is very close or with ranged weapon)
    if(GetHasSpell(SPELL_TIME_STOP))
    {
        float fDistance = GetDistanceBetween(OBJECT_SELF, oIntruder);
        if(fDistance <= 15.0)
        {
            MyCastSpell(SPELL_TIME_STOP, OBJECT_SELF);
            return 1;
        }
    }
    if(GetHasSpell(SPELL_POWER_WORD_STUN) && GetCurrentHitPoints(oIntruder) < 150 && GetIsToughArmand())
    {
        MyCastSpell(SPELL_POWER_WORD_STUN, oIntruder);
        return 1;
    }
    if(GetHasSpell(SPELL_HORRID_WILTING))
    {
        MyCastSpell(SPELL_HORRID_WILTING, oIntruder);
        return 1;
    }
    if(GetHasSpell(SPELL_GREATER_DISPELLING))
    {
        MyCastSpell(SPELL_GREATER_DISPELLING, oIntruder);
        return 1;
    }

    if(HasFightingEnemy())
    {
        //SendMessageToPC(GetFirstPC(), "BOOM: Got Fighting enemy");
        if(GetHasSpell(SPELL_GREAT_THUNDERCLAP))
        {
            MyCastSpell(SPELL_GREAT_THUNDERCLAP, oIntruder);
            return 1;
        }
        if(GetHasSpell(SPELL_SLOW))
        {
            MyCastSpell(SPELL_SLOW, oIntruder);
            return 1;
        }
        if(IsLightlyWounded()
            && HasCloseEnemy() && GetRacialType(oIntruder) != RACIAL_TYPE_UNDEAD
                               && GetRacialType(oIntruder) != RACIAL_TYPE_CONSTRUCT)
        {
            if(GetHasSpell(SPELL_VAMPIRIC_TOUCH))
            {
                MyCastSpell(SPELL_VAMPIRIC_TOUCH, oIntruder);
                return 1;
            }

        }
        if(IsLightlyWounded() && nCharges >= 41
            && HasCloseEnemy() && GetRacialType(oIntruder) != RACIAL_TYPE_UNDEAD
                               && GetRacialType(oIntruder) != RACIAL_TYPE_CONSTRUCT)
        {
            nCharges -= 3;
            SetItemCharges(oStaff, nCharges);
            MyCastSpell(SPELL_NEGATIVE_ENERGY_BURST, OBJECT_SELF, METAMAGIC_ANY, TRUE);
            return 1;
        }
        if(GetHasSpell(SPELL_HOLD_MONSTER))
        {
            MyCastSpell(SPELL_HOLD_MONSTER, oIntruder);
            return 1;
        }
        if(GetHasSpell(SPELL_ENERGY_DRAIN))
        {
            MyCastSpell(SPELL_ENERGY_DRAIN, oIntruder);
            return 1;
        }
        if(GetHasSpell(SPELL_BALL_LIGHTNING))
        {
            MyCastSpell(SPELL_BALL_LIGHTNING, oIntruder);
            return 1;
        }
        if(GetHasSpell(SPELL_GUST_OF_WIND))
        {
            MyCastSpell(SPELL_GUST_OF_WIND, oIntruder);
            return 1;
        }
        if(GetHasSpell(566)) // evil blight
        {
            MyCastSpell(566, oIntruder);
            return 1;
        }


    }
    //SendMessageToPC(GetFirstPC(), "BOOM: Defaulting to generic spells");
    if(IsLightlyWounded()
            && HasCloseEnemy() && GetRacialType(oIntruder) != RACIAL_TYPE_UNDEAD
                               && GetRacialType(oIntruder) != RACIAL_TYPE_CONSTRUCT)
    {
        if(GetHasSpell(SPELL_VAMPIRIC_TOUCH))
        {
            MyCastSpell(SPELL_VAMPIRIC_TOUCH, oIntruder);
            return 1;
        }

    }
    if(GetHasSpell(SPELL_PRISMATIC_SPRAY))
    {
        MyCastSpell(SPELL_PRISMATIC_SPRAY, oIntruder);
        return 1;
    }

    if(GetHasSpell(SPELL_ISAACS_GREATER_MISSILE_STORM) && GetIsToughArmand() )
    {
        MyCastSpell(SPELL_ISAACS_GREATER_MISSILE_STORM, oIntruder);
        return 1;
    }
    if(GetHasSpell(SPELL_SLOW))
    {
        MyCastSpell(SPELL_SLOW, oIntruder);
        return 1;
    }
    if(GetHasSpell(SPELL_FIREBRAND))
    {
        MyCastSpell(SPELL_FIREBRAND, oIntruder);
        return 1;
    }
    if(IsLightlyWounded() && nCharges >= 41
            && HasCloseEnemy() && GetRacialType(oIntruder) != RACIAL_TYPE_UNDEAD
                               && GetRacialType(oIntruder) != RACIAL_TYPE_CONSTRUCT)
    {
        nCharges -= 3;
        SetItemCharges(oStaff, nCharges);
        MyCastSpell(SPELL_NEGATIVE_ENERGY_BURST, OBJECT_SELF, METAMAGIC_ANY, TRUE);
        return 1;
    }
    if(GetHasSpell(SPELL_GUST_OF_WIND))
    {
        MyCastSpell(SPELL_GUST_OF_WIND, oIntruder);
        return 1;
    }
    if(GetRacialType(oIntruder) != RACIAL_TYPE_UNDEAD
        && GetRacialType(oIntruder) != RACIAL_TYPE_CONSTRUCT && nCharges > 35)
    {
        nCharges -= 5;
        SetItemCharges(oStaff, nCharges);
        MyCastSpell(SPELL_ENERGY_DRAIN, oIntruder, METAMAGIC_ANY, TRUE);
        return 1;
    }
    if(GetHasSpell(SPELL_CONTAGION))
    {
        MyCastSpell(SPELL_CONTAGION, oIntruder);
        return 1;
    }
    if(GetHasSpell(SPELL_ENERVATION))
    {
        MyCastSpell(SPELL_ENERVATION, oIntruder);
        return 1;
    }
    if(GetHasSpell(SPELL_LIGHTNING_BOLT))
    {
        MyCastSpell(SPELL_LIGHTNING_BOLT, oIntruder);
        return 1;
    }
    if(GetHasSpell(SPELL_HOLD_PERSON))
    {
        MyCastSpell(SPELL_HOLD_PERSON, oIntruder);
        return 1;
    }
    if(GetHasSpell(SPELL_FLAME_ARROW))
    {
        MyCastSpell(SPELL_FLAME_ARROW, oIntruder);
        return 1;
    }
    if(GetHasSpell(SPELL_ISAACS_LESSER_MISSILE_STORM))
    {
        MyCastSpell(SPELL_ISAACS_LESSER_MISSILE_STORM, oIntruder);
        return 1;
    }
    if(GetHasSpell(SPELL_MELFS_ACID_ARROW))
    {
        MyCastSpell(SPELL_MELFS_ACID_ARROW, oIntruder);
        return 1;
    }
    if(GetHasSpell(520)) // electric loop
    {
        MyCastSpell(520, oIntruder);
        return 1;
    }
    if(GetHasSpell(SPELL_NEGATIVE_ENERGY_RAY) && GetRacialType(oIntruder) != RACIAL_TYPE_UNDEAD
                            && GetRacialType(oIntruder) != RACIAL_TYPE_CONSTRUCT)
    {
        MyCastSpell(SPELL_NEGATIVE_ENERGY_RAY, oIntruder);
        return 1;
    }
    if(GetHasSpell(SPELL_MAGIC_MISSILE))
    {
        MyCastSpell(SPELL_MAGIC_MISSILE, oIntruder);
        return 1;
    }

    return 0;
}



void DoVoiceChat()
{
    int nVoiceStatus = GetLocalInt(OBJECT_SELF, "VOICE_STATUS");
    if(nVoiceStatus == 0)
    {
        SetLocalInt(OBJECT_SELF, "VOICE_STATUS", 1);
        PlayVoiceChat(VOICE_CHAT_THREATEN);
    }
    else
    {
        int nRand = Random(22);
        int nVoice;
        if(nRand == 0) nVoice = VOICE_CHAT_BATTLECRY1;
        else if(nRand == 1) nVoice = VOICE_CHAT_BATTLECRY2;
        else if(nRand == 2) nVoice = VOICE_CHAT_BATTLECRY3;
        else if(nRand == 3) nVoice = VOICE_CHAT_LAUGH;
        else if(nRand == 4) nVoice = VOICE_CHAT_TAUNT;
        if(nRand <= 4)
            PlayVoiceChat(nVoice, OBJECT_SELF);
    }
}

void main()
{
    int nStart = GetLocalInt(GetArea(OBJECT_SELF), "START_ARMAND_BATTLE");
    if(nStart == 0)
        return;

    object oIntruder = GetLocalObject(OBJECT_SELF,"X2_NW_I0_GENERIC_INTRUDER");
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);

    if (GetIsObjectValid(GetAttemptedSpellTarget()) && GetCurrentAction(OBJECT_SELF) == ACTION_CASTSPELL)
       return;

    int nDiff = GetCombatDifficulty();
    SetLocalInt(OBJECT_SELF, "NW_L_COMBATDIFF", nDiff);
    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();

    DoVoiceChat();

    if (__InCombatRound() == TRUE)
    {
        return;
    }
    __TurnCombatRoundOn(TRUE);

    // Executing any special actions (escape, teleport etc')
    if(SpecialAction(oIntruder) != 0)
    {
        __TurnCombatRoundOn(FALSE);
        return;
    }
    // Doing any high-priority buffs
    if (Buff(oIntruder, BUFF_PRIORITY_HIGH) != 0)
    {
        __TurnCombatRoundOn(FALSE);
        return;
    }
    // Doing any med-priority buffs
    if(Buff(oIntruder, BUFF_PRIORITY_MED) != 0)
    {
        __TurnCombatRoundOn(FALSE);
        return;
    }
    // Attack enemies
    if(Attack(oIntruder) != 0)
    {
        __TurnCombatRoundOn(FALSE);
        return;
    }
    // Doing any low-priority buffs
    if(Buff(oIntruder, BUFF_PRIORITY_LOW) != 0)
    {
        __TurnCombatRoundOn(FALSE);
        return;
    }

    //SendMessageToPC(GetFirstPC(), "BOOM: Finished all spells: attacking with staff");
    ActionAttack(oIntruder);
    //object oNearEnemy = GetNearestSeenEnemy();
    //DetermineCombatRound(oNearEnemy);
    __TurnCombatRoundOn(FALSE);
    return;



}


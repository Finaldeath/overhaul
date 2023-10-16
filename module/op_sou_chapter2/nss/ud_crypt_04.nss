//::///////////////////////////////////////////////
//:: Crypt Tower, Level 4 (User-Defined)
//:: UD_Crypt_04.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Launch and handle the Dead Wind battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////

void SignalWindEvent(int iUDNum)
{
    //Relaunch the sequence if oDeadWind is still alive.
    object oDeadWind = GetObjectByTag("DeadWind");
    if (oDeadWind != OBJECT_INVALID)
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(iUDNum));
    }
}

void CreateZombie(object oSpawn)
{
    //Select a random zombie type
    string sZombieType;
    int iRandom = Random(3)+1;
    switch (iRandom)
    {
        case 1:
        {
            sZombieType = "windzombie";
        }
        break;

        case 2:
        {
            sZombieType = "windzombie001";
        }
        break;

        case 3:
        {
            sZombieType = "windzombie002";
        }
        break;
    }

    //Create that zombie type at the given spawn location.
    location lSpawn = GetLocation(oSpawn);
    object oZombie = CreateObject(OBJECT_TYPE_CREATURE, sZombieType, lSpawn);

    //Make it move towards the nearest PC
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oSpawn);
    AssignCommand(oZombie, ActionMoveToObject(oPC));
}

void CreateGreaterZombie(object oSpawn)
{
    //Create a Greater Zombie at the given spawn location.
    location lSpawn = GetLocation(oSpawn);
    object oZombie = CreateObject(OBJECT_TYPE_CREATURE, "windzombie003", lSpawn);

    //Make it move towards the nearest PC
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oSpawn);
    AssignCommand(oZombie, ActionMoveToObject(oPC));
}

void main()
{
    int iUDNum = GetUserDefinedEventNumber();

    switch (iUDNum)
    {
        case 5002:
        {
            //Flag the battle as now active.
            SetLocalInt(OBJECT_SELF, "bActive", TRUE);

            //Assign Pulse VFX
            object oDeadWind = GetObjectByTag("DeadWind");
            effect ePulseVFX = EffectVisualEffect(VFX_FNF_LOS_EVIL_30);
            int iNearestRefPoint = 1;
            object oRefPoint = GetNearestObjectByTag("Reference_Crypt_04", oDeadWind, iNearestRefPoint);
            while (oRefPoint != OBJECT_INVALID)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, ePulseVFX, oRefPoint);
                iNearestRefPoint++;
                oRefPoint = GetNearestObjectByTag("Reference_Crypt_04", oDeadWind, iNearestRefPoint);
            }

            //Kill any remaining zombies
            effect eKill = EffectDamage(500, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_FIVE);
            int iNearestZombie = 1;
            object oZombie = GetNearestObjectByTag("WindZombie", oDeadWind, iNearestZombie);
            while (oZombie != OBJECT_INVALID)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eKill, oZombie);
                //Update the loop variables;
                iNearestZombie++;
                oZombie = GetNearestObjectByTag("WindZombie", oDeadWind, iNearestZombie);
            }

            //Spawn in new zombies
            effect eRaise = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
            int iNearestSpawn = 1;
            object oSpawn = GetNearestObjectByTag("Crypt_04_ZombieSpawn", oDeadWind, iNearestSpawn);
            location lSpawn = GetLocation(oSpawn);

         //Greater Zombie
            //Apply the Raise VFX
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eRaise, lSpawn);
            //Spawn in a zombie
            DelayCommand(1.0, CreateGreaterZombie(oSpawn));
            //Update the loop variables;
            iNearestSpawn++;
            oSpawn = GetNearestObjectByTag("Crypt_04_ZombieSpawn", oDeadWind, iNearestSpawn);
            lSpawn = GetLocation(oSpawn);

         //Normal zombies
            while (oSpawn != OBJECT_INVALID)
            {
                //Apply the Raise VFX
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eRaise, lSpawn);

                //Spawn in a zombie
                DelayCommand(1.0, CreateZombie(oSpawn));

                //Update the loop variables;
                iNearestSpawn++;
                oSpawn = GetNearestObjectByTag("Crypt_04_ZombieSpawn", oDeadWind, iNearestSpawn);
                lSpawn = GetLocation(oSpawn);
            }

            //Render Dead Wind invulnerable for 30 seconds
            SetPlotFlag(oDeadWind, TRUE);
            effect eInvulnerable = EffectVisualEffect(VFX_FNF_NATURES_BALANCE);
            object oSFX_Loop = GetObjectByTag("SFX_DeadWind");
            SoundObjectPlay(oSFX_Loop);
            SoundObjectSetVolume(oSFX_Loop, 127);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind);
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(12.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(14.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(16.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(18.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(20.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(22.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(24.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(26.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(28.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind));
            DelayCommand(30.0, SetPlotFlag(oDeadWind, FALSE));
            DelayCommand(30.0, SoundObjectStop(oSFX_Loop));

            //Launch the sequence again 15 seconds, provided oDeadWind is still alive.
            DelayCommand(45.0, SignalWindEvent(5002));
        }
        break;

        //Handle the pre-trigger VFX
        case 5015:
        {
            object oDeadWind = GetObjectByTag("DeadWind");
            effect eInvulnerable = EffectVisualEffect(VFX_FNF_NATURES_BALANCE);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvulnerable, oDeadWind);

            //Repeat the sequence every 2 seconds until player 5002 is triggered.
            int bActive = GetLocalInt(OBJECT_SELF, "bActive");
            if (bActive == FALSE)
            {
                DelayCommand(2.0, SignalWindEvent(5015));
            }
        }
        break;
    }
}

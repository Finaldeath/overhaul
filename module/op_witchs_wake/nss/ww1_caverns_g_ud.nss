//::///////////////////////////////////////////////
//:: Witchwork 1: Embattled Caverns, Lesser User-Defined
//:: WW1_Caverns_L_UD.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This user-defined creature script causes the
     various lesser kobolds & goblins to say
     appropriate text messages.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:://////////////////////////////////////////////

void main()
{
    //Process Default User-Defined Events
    int iUDNum = GetUserDefinedEventNumber();
    switch (iUDNum)
    {
        case 1001: //User-Defined Heartbeat Event
        {

        }
        break;

        case 1002: //User-Defined OnPerceive Event
        {
            object oTarget = GetLastPerceived();
            int iTargetType = GetObjectType(oTarget);
            int bTargetSeen = GetLastPerceptionSeen();
            int bTargetDead = GetIsDead(oTarget);

            //Optimize to only pay attention to seen creatures.
            if (iTargetType == OBJECT_TYPE_CREATURE &&
                bTargetSeen == TRUE &&
                bTargetDead == FALSE)
            {
                int iMyRace = GetRacialType(OBJECT_SELF);
                int iTargetRace = GetRacialType(oTarget);
                string sMessage;

                //If I'm a goblin...
                if (iMyRace == RACIAL_TYPE_HUMANOID_GOBLINOID)
                {
                    //...and I see a kobold...
                    if (iTargetRace == RACIAL_TYPE_HUMANOID_REPTILIAN)
                    {
                        //...pick randomly from the following message list.
                        int iRandom = Random(3)+1;
                        switch (iRandom)
                        {
                            case 1: sMessage = "Eeek! Kobolds!"; break;
                            case 2: sMessage = "Die, kobold, die!"; break;
                            case 3: sMessage = "Our caves! We here first!"; break;
                        }
                    }

                    //...and I see a fellow goblin...
                    if (iTargetRace == RACIAL_TYPE_HUMANOID_GOBLINOID)
                    {
                        //...pick randomly from the following message list.
                        int iRandom = Random(3)+1;
                        switch (iRandom)
                        {
                            case 1: sMessage = "Oh, phew! I thought you was kobold!"; break;
                            case 2: sMessage = "Where they coming from?"; break;
                            case 3: sMessage = "Spread out, okay?"; break;
                        }
                    }

                    //...and I see a PC...
                    else
                    {
                        //...only say something 1/3 of the time.
                        int iRandom = Random(3)+1;

                        if (iRandom == 1)
                        {
                            //...use the PC's race to determine the message.
                            switch (iTargetRace)
                            {
                                case RACIAL_TYPE_DWARF: sMessage = "Ignore the dwarf!"; break;
                                case RACIAL_TYPE_ELF: sMessage = "Ignore the elf!"; break;
                                case RACIAL_TYPE_GNOME: sMessage = "Ignore the gnome!"; break;
                                case RACIAL_TYPE_HALFELF: sMessage = "Ignore the half-elf!"; break;
                                case RACIAL_TYPE_HALFLING: sMessage = "Ignore the halfling!"; break;
                                case RACIAL_TYPE_HALFORC: sMessage = "Ignore the half-orc!"; break;
                                case RACIAL_TYPE_HUMAN: sMessage = "Ignore the human!"; break;
                            }
                        }
                    }
                }

                //If I'm a kobold...
                if (iMyRace == RACIAL_TYPE_HUMANOID_REPTILIAN)
                {
                    //...and I see a goblin...
                    if (iTargetRace == RACIAL_TYPE_HUMANOID_GOBLINOID)
                    {
                        //...pick randomly from the following message list.
                        int iRandom = Random(3)+1;
                        switch (iRandom)
                        {
                            case 1: sMessage = "Boo! Hee-hee, stupid goblins!"; break;
                            case 2: sMessage = "The goblins are coming! The goblins are coming!"; break;
                            case 3: sMessage = "Get out of our caves! Finders keepers!"; break;
                        }
                    }

                    //...and I see a fellow kobold...
                    if (iTargetRace == RACIAL_TYPE_HUMANOID_REPTILIAN)
                    {
                        //...pick randomly from the following message list.
                        int iRandom = Random(3)+1;
                        switch (iRandom)
                        {
                            case 1: sMessage = "Let's show them stupid goblins!"; break;
                            case 2: sMessage = "Wait up, I'm coming!"; break;
                            case 3: sMessage = "You see any of them?"; break;
                        }
                    }

                    //...and I see a PC...
                    else
                    {
                        //...only say something 1/3 of the time.
                        int iRandom = Random(3)+1;

                        if (iRandom == 1)
                        {
                             //...use the PC's race to determine the message.
                            switch (iTargetRace)
                            {
                                case RACIAL_TYPE_DWARF: sMessage = "Forget the dwarf!"; break;
                                case RACIAL_TYPE_ELF: sMessage = "Forget the elf!"; break;
                                case RACIAL_TYPE_GNOME: sMessage = "Forget the gnome!"; break;
                                case RACIAL_TYPE_HALFELF: sMessage = "Forget the half-elf!"; break;
                                case RACIAL_TYPE_HALFLING: sMessage = "Forget the halfling!"; break;
                                case RACIAL_TYPE_HALFORC: sMessage = "Forget the half-orc!"; break;
                                case RACIAL_TYPE_HUMAN: sMessage = "Forget the human!"; break;
                            }
                        }
                    }
                }

                //Speak the message string, provided there is one.
                if (sMessage != "")
                {
                    SpeakString(sMessage);
                }
            }
        }
        break;

        case 1003: //User-Defined EndCombatRound Event
        {

        }
        break;

        case 1004: //User-Defined OnDialog Event
        {

        }
        break;

        case 1005: //User-Defined OnAttack Event
        {

        }
        break;

        case 1006: //User-Defined OnDamaged Event
        {

        }
        break;

        case 1007: //User-Defined OnDeath Event
        {

        }
        break;

        case 1008: //User-Defined OnDisturbed Event
        {

        }
        break;
    }
}

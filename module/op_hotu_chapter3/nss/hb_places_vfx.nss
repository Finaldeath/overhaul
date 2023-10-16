//::///////////////////////////////////////////////
//:: Knower of Places, VFX (Area Heartbeat)
//:: HB_Places_VFX.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle all the wierd tile geometry VFX.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 2, 2003
//:://////////////////////////////////////////////

void main()
{
    //Only do this if there's a PC in the area
    object oRefPoint = GetObjectByTag("q4a_portal_wp");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oRefPoint);
    if (oPC != OBJECT_INVALID)
    {
        //Define the Loop variables
        int iVFXSource = 0;
        object oVFXSource = GetObjectByTag("H5_Places_VFX", iVFXSource);

        //Loop through all of the VFX sources
        while (iVFXSource < 12)
        {
            //Determine a random target for the current VFX Source
            int iVFXTarget = Random(11)+1;
            object oVFXTarget = GetNearestObjectByTag("H5_Places_VFX", oVFXSource, iVFXTarget);

            //Determine which VFX spell to use.
            int iSpellID;
            int iSpell = Random(5);
            switch (iSpell)
            {
                case 0:
                    iSpellID = 753; //City Exterior, Plaza 1
                    break;
                case 1:
                    iSpellID = 754; //City Exterior, Slum House 2
                    break;
                case 2:
                    iSpellID = 755; //Dungeon, Pillar 3
                    break;
                case 3:
                    iSpellID = 765; //Forest, Big Tree
                    break;
                case 4:
                    iSpellID = 766; //Crypt, Treasure 2
                    break;
            }

            //Determine an appropriate delay.
            int iDelay = Random(60);
            float fDelay = IntToFloat(iDelay)/10;

            //Cast the VFX spell.
            AssignCommand(oVFXSource, DelayCommand(fDelay, ActionCastFakeSpellAtObject(iSpellID, oVFXTarget, PROJECTILE_PATH_TYPE_DEFAULT)));

            //Update the Loop variables
            iVFXSource++;
            oVFXSource = GetObjectByTag("H5_Places_VFX", iVFXSource);
        }
    }
}

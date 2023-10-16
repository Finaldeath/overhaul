// just let it seem as the last jumper inside the well is doing something

void main()
{
    int nPlay = GetLocalInt(OBJECT_SELF, "PLAY");
    if(nPlay == 0)
        return;
    int nRand = Random(8) + 1;
    int nAnim;

    if(nRand == 1)       nAnim = ANIMATION_FIREFORGET_GREETING;
    else if(nRand == 2)  nAnim = ANIMATION_FIREFORGET_PAUSE_BORED;
    else if(nRand == 3)  nAnim = ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD;
    else if(nRand == 4)  nAnim = ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD;
    else if(nRand == 5)  nAnim = ANIMATION_FIREFORGET_TAUNT;
    else
        return;

    ClearAllActions();
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    SetFacingPoint(GetPosition(oPC));
    ActionPlayAnimation(nAnim);


}

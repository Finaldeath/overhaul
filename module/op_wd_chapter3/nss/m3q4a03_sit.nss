//* Uthgardt is sitting
//* while injured
void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_M3Q04TALKHEALED") == 0)
    {
//        SpeakString("I am not healed.");
        if (GetIsInCombat()==FALSE)
        {
//            SpeakString("I am not in combat");
            if (GetCurrentAction()==ACTION_INVALID)
            {
//                SpeakString("I am not moving.");
                ClearAllActions();
                PlayAnimation(ANIMATION_LOOPING_SIT_CROSS,1.0, 10.0);
            }
        }
    }
}

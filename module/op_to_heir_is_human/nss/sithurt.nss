void main()
{
    if(IsInConversation(OBJECT_SELF) == FALSE &&
           GetCurrentAction() == ACTION_INVALID)
        {
            ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS,1.0,4000.0);
        }
}

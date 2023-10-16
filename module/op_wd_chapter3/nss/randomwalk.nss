// * creature randomly walks around
// * cannot be interacted with

void main()
{
    if (IsInConversation(OBJECT_SELF) == FALSE)
    {
        ClearAllActions();
        ActionRandomWalk();
    }
}

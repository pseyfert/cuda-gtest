#include "cuda-gtest.h"

__global__ void DoNothing() {
}

TEST(TestWrapper, Pass) {
  ASSERT_LAUNCH_GOOD(DoNothing<<<1, 1>>>());
}

TEST(TestWrapper, Overcommit) {
  ASSERT_LAUNCH_BAD(DoNothing<<<4096, 4096>>>());
}

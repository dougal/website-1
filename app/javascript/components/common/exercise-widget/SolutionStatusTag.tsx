import React from 'react'
import { SolutionStatus } from '../../types'

export const SolutionStatusTag = ({
  status,
}: {
  status: SolutionStatus
}): JSX.Element => {
  switch (status) {
    case 'published':
      return <div className="c-exercise-status-tag --published">Published</div>
    case 'completed':
      return <div className="c-exercise-status-tag --completed">Completed</div>
    case 'started':
    case 'iterated':
      return (
        <div className="c-exercise-status-tag --in-progress">In-progress</div>
      )
  }
}

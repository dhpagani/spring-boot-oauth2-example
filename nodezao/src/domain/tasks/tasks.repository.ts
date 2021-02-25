import { Task } from 'src/domain/tasks/task.entity';
import { EntityRepository } from 'typeorm';
import AbstractRepositoryRT from '../core/abstract.repository';

@EntityRepository(Task)
export class TasksRepository extends AbstractRepositoryRT<Task> {}
